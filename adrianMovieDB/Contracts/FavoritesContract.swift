//
//  FavoritesContract.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit


protocol FavoritesViewControllerContract: AnyObject {
    var presenter: FavoritesPresenterContract? { get set }
    func viewDidLoad()
   static func createFromStoryboard() -> FavoritesViewController
    func reloadData()
    
}

protocol FavoritesPresenterContract: AnyObject {
    var view: FavoritesViewControllerContract? { get set }
    var interactor: FavoritesInteractorContract? {  get set }
    var wireframe: FavoritesWireframeContract? {  get set }
    var numMovies: Int { get }
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel
    func viewDidLoad()
    func getFavorites()
}

protocol FavoritesInteractorContract: AnyObject {
    var favoritesProvider: FavoritesStorageContract? { get set }
    var output: FavoritesOutputContract? { get set }
    func getFavorites(movies: [Movie]) 
}

protocol FavoritesWireframeContract: AnyObject {
    var view: UIViewController? { get set }
    func navigateTo()
}

protocol FavoritesStorageContract: AnyObject {
    var favoriteMovies: [Movie] { get set }
    func getFavorites(_ completion: @escaping(Result<[Movie],ProviderError>) -> Void)
    func saveFavorite(_ movie: Movie)
    func removeFavoriteAt(_ index: Int)
    func copyFavorites(_ movies: [Movie]) 
}

protocol FavoritesOutputContract: AnyObject {
    func getFavorites(movies: [Movie])
    func getFavoritesFail(movies: [Movie])
}
