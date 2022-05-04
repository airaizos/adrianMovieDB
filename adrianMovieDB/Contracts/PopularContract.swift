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
    
    func setFavorite(_ favorite: Bool, at indexPath: IndexPath)
    
   static func createFromStoryboard() -> PopularViewController
}

protocol PopularPresenterContract: AnyObject {
    var view: PopularViewControllerContract? { get set }
    var interactor: PopularInteractorContract? {  get set }
    var wireframe: PopularWireframeContract? {  get set }
    var numMovies: Int  { get }
    
    func viewDidLoad()
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel
    func didSearch(with searchText: String)
    func didSelectFavorite(at indexPath: IndexPath)
    func isFavorite(at indexPath: IndexPath) -> Bool
    func fetchMore()
}

protocol PopularInteractorContract: AnyObject {
    var popularProvider: PopularProviderContract? { get set }
    var output: PopularOutputContract? { get set }
    func fetchMovies()
    func fetchAnother(page: Int)
   
}

protocol PopularWireframeContract: AnyObject {
    var view: UIViewController? { get set }
    func navigateTo()
}

protocol PopularProviderContract: AnyObject {
    func fetchPopular(_ completion: @escaping(Result<[Movie],ProviderError>)-> Void)
    
    func fetchAnother(page: Int, _ completion: @escaping(Result<[Movie], ProviderError>) -> Void)
}

protocol PopularOutputContract: AnyObject {
    func didFetch(movies: [Movie])
    func didFetchFail(movies: [Movie])
    
    func didUpdateFavorites(in movie: Movie, favorite: Bool)
}

protocol PopularTableViewDelegate {
    func didPressInFavorite(cell: MovieViewCell)
    
}
