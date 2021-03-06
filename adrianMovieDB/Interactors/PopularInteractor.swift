//
//  PopularInteractor.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation

class PopularInteractor: PopularInteractorContract {
    
    var popularProvider: ProviderContract?
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
    
    
    func fetchMovies(page: Int, section: UrlParameter, query: String) {
        
        popularProvider?.fetchMovies(page: page, section: section, query: query, { result in
            switch result {
            case .success(let movies): self.output?.didFetch(movies: movies)
            case .failure: self.output?.didFetchFail(movies: [Movie(id: 0, title: "title", originalTitle: "originalTitle", favorite: false, year: "year", image: "image", overview: "overview")]
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
