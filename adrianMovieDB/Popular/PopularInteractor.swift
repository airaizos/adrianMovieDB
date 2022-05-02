//
//  PopularInteractor.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation

class PopularInteractor: PopularInteractorContract {
    var popularProvider: PopularProviderContract?
    var output: PopularOutputContract?
    
    private static var favoritesKey = "favorites.popular.movie.array"
    private let userDefaults: UserDefaults
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    private var favorites : [String]   {
        get {
            userDefaults.stringArray(forKey: PopularInteractor.favoritesKey) ?? []
            }
        set {
                userDefaults.setValue(newValue, forKey: PopularInteractor.favoritesKey)
            }
        }
    
    func fetchMovies() {
        popularProvider?.fetchPopular( { result in
            switch result {
            case .success(let movies): self.output?.didFetch(movies: movies)
            case .failure: self.output?.didFetchFail(movies: [Movie(id: 41490, title: "No se ha podido descargar", favorite: false, year: "")]
            )
            }
        })
    }
}

extension PopularInteractor {
    
    func didPressFavorite(in movie: Movie) {
        if !favorites.contains(String(movie.id)) {
            favorites.append(String(movie.id))
            output?.didUpdateFavorites(in: movie, favorite: true)
        }  else if let index = favorites.firstIndex(of: String(movie.id)) {
            favorites.remove(at: index)
            output?.didUpdateFavorites(in: movie, favorite: false)
        }
    }
}
