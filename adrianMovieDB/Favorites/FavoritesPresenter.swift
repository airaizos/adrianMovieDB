//
//  FavoritesPresenter.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit

class FavoritesPresenter: FavoritesPresenterContract {
    
    var view: FavoritesViewControllerContract?
    var interactor: PopularInteractorContract?
    var wireframe: FavoritesWireframeContract?
    
    var numMovies: Int {
        favoriteMovies.count
    }
    
    private var movies = [Movie]()
    private var idMovies = 860623
    private var favoriteMovies = [Movie]() {
        didSet {
            favoriteMovies = movies.filter{ $0.id == idMovies }
            view?.reloadData()
            }
    }
    
    func viewDidLoad() {
        getFavorites()
    }
    
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel {
        let movie = favoriteMovies[IndexPath.row]
        return movie.toTableCellViewModel
    }
    
    func getFavorites() {
        interactor?.output = self
    }
}

extension FavoritesPresenter: PopularOutputContract {
    func didFetch(movies: [Movie]) {
        
    }
    
    func didFetchFail(movies: [Movie]) {
        
    }
    
    func didUpdateFavorites(in movie: Movie, favorite: Bool) {
        
    }
}
