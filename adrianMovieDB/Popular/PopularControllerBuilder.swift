//
//  PopularControllerBuilder.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit

class PopularControllerBuilder {
    func build() -> UIViewController {
        let viewController = PopularViewController.createFromStoryboard()
        let presenter = PopularPresenter()
        let interactor = PopularInteractor()
        let wireframe = PopularWireframe()
        let fetchMovies = PopularURLSessionProvider()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.view = viewController
        
        interactor.popularProvider = fetchMovies
        
        return viewController
    }
    
}
