//
//  Movie.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation

struct MoviesResults: Codable {
    var results: [Movie]
}

struct Movie: Codable, Equatable {
    let id: Int
    let title: String
    let originalTitle: String
    let favorite: Bool
    let year: String?
    let image: String?
    let overview: String
    
 enum CodingKeys: String, CodingKey {
     case id
     case title
     case originalTitle = "original_title"
     case favorite = "adult"
     case year = "release_date"
     case image = "backdrop_path"
     case overview
    }
}

struct MovieViewCellModel {
    let title: String
    let year: String
    let favorite: Bool
}


extension Movie {
    var toTableCellViewModel: MovieViewCellModel {
        MovieViewCellModel(title: title, year: year ?? "", favorite: favorite)
    }
    
    var toMovieDetailViewModel: MovieDetailViewModel {
        MovieDetailViewModel(originalTitle: originalTitle, id: id, year: year!.isEmpty ? "No year" : year!, isFavorite: favorite, image: image != nil ? "https://image.tmdb.org/t/p/w500\(image!)" : "tmdb", title: title, overview: overview)
    }
}
