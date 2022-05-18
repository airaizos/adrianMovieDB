//
//  MoviesParser.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 16/5/22.
//

import Foundation

class MoviesParser {
    private let decoder: JSONDecoder
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func parse(data: Data) -> MoviesResults {
        return (try? decoder.decode(MoviesResults.self, from: data)) ?? MoviesResults(results: [Movie(id: 0, title: "No data", favorite: true, year: "No data", image: "No data")])
    }
    
}
