//
//  FavoritesInteractor.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation

class FavoritesInteractor: FavoritesInteractorContract {
    var output: FavoritesOutputContract?
    var favoritesProvider: FavoritesProviderContract?
    
    func getFavorites(movies: [Movie]) {
        favoritesProvider?.getFavorites({ result in
            switch result {
            case .success(let favoritesMovies):
                self.output?.getFavorites(movies: favoritesMovies)
            case .failure: self.output?.getFavoritesFail(movies: [Movie(id: 41490, title: "No se ha podido descargar", favorite: false, year: "")])
            }
        })
    }
    
    private static var favoritesKey =  "favorite.movies.array"
    private let userDefaults: UserDefaults
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    private var favorites : [String] {
        get {
            userDefaults.stringArray(forKey: FavoritesInteractor.favoritesKey) ?? []
        }
        set {
            userDefaults.setValue(newValue, forKey: FavoritesInteractor.favoritesKey)
        }
    }
    
}
