//
//  PopularLocalProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 29/4/22.
//

import Foundation


class PopularLocalProvider: PopularProviderContract {
    var movies = [Movie]()
    
    func fetchPopular() {
        movies.append(Movie(id: UUID(), title: "La familia Bellie", favorite: true, year: "2014"))
        
    }
    
    
}
