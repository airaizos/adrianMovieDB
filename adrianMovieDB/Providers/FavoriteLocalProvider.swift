//
//  FavoriteLocalProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 2/5/22.
//

import Foundation

class FavoriteLocalProvider: FavoritesProviderContract {
    var favoriteMovies = [Movie]()
    
    
    func getFavorites(_ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
        let favoritesMovies = [Movie]()
        completion(.success(favoritesMovies))
    }
    
    func saveFavorite(_ movie: Movie) {
        self.favoriteMovies.append(movie)
    }
    func removeFavoriteAt(_ index: Int) {
        self.favoriteMovies.remove(at: index)
    }
    
    func copyFavorites(_ movies: [Movie]) {
        self.favoriteMovies = movies
    }
    
}
