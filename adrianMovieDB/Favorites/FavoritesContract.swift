//
//  FavoritesContract.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit


protocol FavoritesViewControllerContract {
    var presenter: FavoritesPresenterContract? { get set }
    func viewDidLoad()
   static func createFromStoryboard() -> FavoritesViewController
    func reloadData()
    
}

protocol FavoritesPresenterContract {
    var view: FavoritesViewControllerContract? { get set }
    var interactor: PopularInteractorContract? {  get set }
    var wireframe: FavoritesWireframeContract? {  get set }
    var numMovies: Int { get }
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel
    func viewDidLoad()
    
}

protocol FavoritesInteractorContract {
    
}

protocol FavoritesWireframeContract {
    var view: UIViewController? { get set }
    func navigateTo()
}

protocol FavoritesProviderContract {
    
   // var favorites: [String] {  get set }
}
