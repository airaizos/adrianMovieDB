//
//  PopularContract.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit

protocol PopularViewControllerContract: UIViewController {
    var presenter: PopularPresenterContract? { get set }
    func viewDidLoad()
    func reloadData()
    
   static func createFromStoryboard() -> PopularViewController
}

protocol PopularPresenterContract {
    var view: PopularViewControllerContract? { get set }
    var interactor: PopularInteractorContract? {  get set }
    var wireframe: PopularWireframeContract? {  get set }
    var numMovies: Int  { get }
    
    func viewDidLoad()
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel
    func didSearch(with searchText: String)
}

protocol PopularInteractorContract {
    var popularProvider: PopularProviderContract? { get set }
    var output: PopularOutputContract? { get set }
    func fetchMovies() 
}

protocol PopularWireframeContract {
    var view: UIViewController? { get set }
    func navigateTo()
}

protocol PopularProviderContract {
    func fetchPopular(_ completion: @escaping(Result<[Movie],ProviderError>)-> Void)
    
}

protocol PopularOutputContract {
    func didFetch(movies: [Movie])
    func didFetchFail(movies: [Movie])
}

//FILM

protocol PopularProviderFilmContract {
    func fetchPopular(_ completion: @escaping(Result<[Film],ProviderError>)-> Void)
    
}

protocol PopularOutputFilmContract {
    func didFetch(movies: [Film])
    func didFetchFail(movies: [Film])
}
