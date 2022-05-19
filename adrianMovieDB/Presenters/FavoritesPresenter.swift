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
    var interactor: FavoritesInteractorContract?
    var wireframe: FavoritesWireframeContract?
    var favoriteProvider: FavoriteLocalProvider?
    
    var numMovies: Int {
        favoriteMovies.count
    }
    
    private var favoriteMovies = [Movie(id: 1, title: "title", favorite: true, year: "",image: "")] {
        didSet {
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
}

extension FavoritesPresenter: FavoritesOutputContract {
    
    func getFavoritesFail(movies: [Movie]) {
        self.favoriteMovies = movies
    }
    
    func getFavorites() {
        interactor?.output = self
        interactor?.getFavorite(movies: favoriteMovies)
        view?.reloadData()
    }
  
    func getFavorites(movies: [Movie]) {
        self.favoriteMovies = movies
    }
}
