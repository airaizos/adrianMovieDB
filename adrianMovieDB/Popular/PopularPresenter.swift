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
    
    var numMovies: Int {
        movies.count
    }
    
    private var movies = [Movie]() {
        didSet {
            view?.reloadData()
        }
    }
    
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel {
        let movie = movies[IndexPath.row]
        return movie.toTableCellViewModel
    }
    
    func viewDidLoad() {
        fetchMovies()
    }
    
    func fetchMovies() {
        interactor?.fetchMovies()
    }

    
    
}
