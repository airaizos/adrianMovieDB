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
    var favoritesProvider: FavoritesProviderContract?
    
    private var favorites: [Int]() {
        get {
            favoritesProvider.
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
    //Favorites en interactor
  //  private let fileManager??
    
}
