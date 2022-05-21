//
//  MoviesURLBuilder.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 16/5/22.
//

import Foundation

struct PopularMovies: UrlParameterSeparado {
    var section: String {
        return "movie/popular"
    }
}

struct SearchMovies: UrlParameterSeparado {
    var section: String {
        return "search/movie"
    }
}

class MoviesURLBuilder {
    private let hostName: String
    private let apiKey: String
    private let language: String
    private let region: String
    let page: Int
    let urlParameter: String
    let query: String?
    
    init(hostName: String,apiKey: String, language: String, page: Int, urlParameter: UrlParameter, query: String, region: String) {
        self.hostName = "https://api.themoviedb.org/3/"
        self.apiKey = "1ed1b35f1dd69fbc9fdce2d768e3e870"
        self.language = "en-US"
        self.region = region
        self.page = page
        self.urlParameter = urlParameter.section
        self.query = "&query=\(query)"
        
        
    }
    
    func getURL(apiSection: String, query: String?, page: Int) -> URLRequest {
        
        let url = URL(string: "\(hostName)\(apiSection)?api_key=\(apiKey)&language=\(language)\(query!)&page=\(page)&region=\(region)")!
        let request = URLRequest(url: url)
        
        return request
    }
}
