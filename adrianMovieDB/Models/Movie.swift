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
    let favorite: Bool
    let year: String?
    let image: String?
    
 enum CodingKeys: String, CodingKey {
     case id
     case title
     case favorite = "adult"
     case year = "release_date"
     case image = "backdrop_path"
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
}
