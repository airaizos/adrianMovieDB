//
//  Film.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 1/5/22.
//

import Foundation

// MARK: - Welcome
struct FilmResults: Codable {
    let page: Int
    let results: [Film]
}

// MARK: - Result
struct Film: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension Film {
    var toTableCellViewModel: MovieViewCellModel {
        MovieViewCellModel(title: title, year: releaseDate, favorite: adult)
    }
}
