//
//  PopularLocalProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 29/4/22.
//

import Foundation

enum ProviderError: Error {
    case badUrl, generic(Error?), unableToFindFile, parseError(Error?)
}

class PopularLocalProvider {
    var movies = [Movie]()
    
    func fetchMovies(_ completion: @escaping(Result<[Movie],ProviderError>)-> Void) {
        completion(.success([Movie(id: 0, title: "title", originalTitle: "originalTitle", favorite: false, year: "year", image: "image", overview: "overview")]))
    }
}
