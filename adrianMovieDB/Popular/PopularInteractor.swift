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
    
    func fetchMovies() {
        popularProvider?.fetchPopular( { result in
            switch result {
            case .success(let movies): self.output?.didFetch(movies: movies)
            case .failure: self.output?.didFetchFail(movies: [Movie(id: 414906, title: "No se ha podido descargar", favorite: false, year: "")]
           //[Film(adult: true, backdropPath: "Error", genreIDS: [1], id: 1, originalLanguage: "Error", originalTitle: "Error", overview: "Error", popularity: 1, posterPath: "Error", releaseDate: "Error", title: "Error", video: true, voteAverage: 1, voteCount: 1)]
            )
            }
        })
    }
}
