//
//  PopularWireframe.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit

class PopularWireframe: PopularWireframeContract {
    var view: UIViewController?
    
    func navigateTo(to movie: Movie) {
        DispatchQueue.main.async {
            let viewController = MovieDetailControllerBuilder().build(viewModel: movie.toMovieDetailViewModel)
            
            if let navigationController = self.view?.navigationController {
                navigationController.pushViewController(viewController, animated: true)
            } else {
                self.view?.present(viewController, animated: true)
            }
        }
    }
}
