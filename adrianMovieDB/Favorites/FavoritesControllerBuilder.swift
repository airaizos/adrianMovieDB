//
//  FavoritesControllerBuilder.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit

class FavoritesControllerBuilder {
    func build() -> UIViewController {
        let viewController = FavoritesViewController.createFromStoryboard()
        let presenter = FavoritesPresenter()
        let interactor = FavoritesInteractor()
        let wireframe = FavoritesWireframe()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        
        return viewController
    }
}
