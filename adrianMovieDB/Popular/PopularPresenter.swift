//
//  PopularPresenter.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation

class PopularPresenter: PopularPresenterContract {
    var view: PopularViewControllerContract?
    var interactor: PopularInteractorContract?
    var wireframe: PopularWireframeContract?
    
    private var movies = [Movie]() {
        didSet {
            view?.reloadData()
        }
    }
    
    func viewDidLoad() {
        fetchMovies()
    }
    
    func fetchMovies() {
        interactor?.fetchMovies()
    }

    
    
}
