//
//  Movie.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation

struct MoviesResults: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: UUID
    let title: String
    let favorite: Bool
    let year: String
    
 enum CodingKeys: String, CodingKey {
     case id
     case title
     case favorite
     case year = "release_date"
    }
}

struct MovieViewCellModel {
    let title: String
    let year: String
    let favorite: Bool
}


extension Movie {
    var toTableCellViewModel: MovieViewCellModel {
        MovieViewCellModel(title: title, year: year, favorite: favorite)
    }
}
