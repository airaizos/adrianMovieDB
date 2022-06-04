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
    var isSearching: Bool { get set }
    var page: Int { get set }
    var searchPage: Int { get set }
    func fetchSearchedMovies(with searchText: String)
    func restartMovies()
    func viewDidLoad()
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel
    func didSelectMovie(at indexPath: IndexPath)
    func didSearch(with searchText: String)
    func didSelectFavorite(at indexPath: IndexPath)
    func isFavorite(at indexPath: IndexPath) -> Bool
    func fetchMovies()
}

protocol PopularInteractorContract: AnyObject {
    var popularProvider: ProviderContract? { get set }
    var output: PopularOutputContract? { get set }
    func fetchMovies(page: Int, section: UrlParameter, query: String)

}

protocol PopularWireframeContract: AnyObject {
    var view: UIViewController? { get set }
    func navigateTo(to movie: Movie)
}

protocol ProviderContract: AnyObject {

    func fetchMovies(page: Int, section: UrlParameter, query: String, _ completion: @escaping(Result<[Movie], ProviderError>) -> Void)
}

protocol PopularOutputContract: AnyObject {
    func didFetch(movies: [Movie])
    func didFetchFail(movies: [Movie])
    
    func didUpdateFavorites(in movie: Movie, favorite: Bool)
}

protocol PopularTableViewDelegate {
    func didPressInFavorite(cell: MovieViewCell)
    
}
