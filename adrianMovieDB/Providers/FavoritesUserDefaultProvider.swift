//
//  FavoritesUserDefaultProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 2/5/22.
//

import Foundation

class FavoritesUserDefaultsProvider: FavoritesStorageContract {
    func copyFavorites(_ movies: [Movie]) {
        
    }
    
    func saveFavorite(_ movie: Movie) {
        
    }
    
    func removeFavoriteAt(_ index: Int) {
        
    }
    
    func getFavorites(_ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
        
    }
    
    var favoriteMovies = [Movie]()
    
    private static var favoritesKey = "favorites.movies.array"
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    /*
    var favorites: [String] {
        get  {
            userDefaults.stringArray(forKey: FavoritesUserDefaultsProvider.favoritesKey) ?? []
        } set {
            userDefaults.setValue(newValue, forKey: FavoritesUserDefaultsProvider.favoritesKey)
        }
    }
    
    */
    /*
    var favorites: [String]
    
    func fetchFavorites(_ completion: @escaping (Result<[String],ProviderError>) -> Void) {
        completion(.success(userDefaults.stringArray(forKey: FavoritesUserDefaultsProvider.favoritesKey) ?? []))
    }
    
    func setFavorites(favorites: [String],_ completion: @escaping (Result<[String],ProviderError>) -> Void) {
        completion(.success(userDefaults.setValue(favorites, forKey: FavoritesUserDefaultsProvider.favoritesKey)))
            
            /*userDefaults.setValue(newValue, forKey: FavoritesUserDefaultsProvider.favoritesKey)))*/
    }
     */
}
