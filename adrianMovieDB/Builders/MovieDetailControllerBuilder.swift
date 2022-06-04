//
//  MovieDetailControllerBuilder.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 22/5/22.
//

import Foundation
import UIKit

class MovieDetailControllerBuilder {
    func build(viewModel: MovieDetailViewModel) -> UIViewController {
        
        let viewController = MovieDetailViewController.create()
        
        viewController.viewModel = viewModel
        return viewController
    }
}
