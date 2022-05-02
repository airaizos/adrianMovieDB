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
}

protocol FavoritesPresenterContract {
    var view: FavoritesViewControllerContract? { get set }
    var interactor: FavoritesInteractorContract? {  get set }
    var wireframe: FavoritesWireframeContract? {  get set }
}

protocol FavoritesInteractorContract {
    var favoritesProvider: FavoritesProviderContract? { get set }
    
}

protocol FavoritesWireframeContract {
    var view: UIViewController? { get set }
    func navigateTo()
}

protocol FavoritesProviderContract {
    
}
