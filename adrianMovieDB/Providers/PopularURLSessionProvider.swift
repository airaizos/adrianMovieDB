//
//  PopularURLSessionProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 1/5/22.
//

import Foundation

enum UrlParameter {
    case popular, search
    
    var section: String {
        switch self {
        case .popular:
            return "movies/popular"
        case .search:
            return "search/movie"
        }
    }
    
}

class PopularURLSessionProvider: ProviderContract {
    
    let api = "https://api.themoviedb.org/3/"
    let apiKey = "1ed1b35f1dd69fbc9fdce2d768e3e870"
    let language = "es-ES"
    let region = "es-ES"
    var query: String {
        if self.query == "" {
            return ""
        } else {
            return "&query=\(self.query)"
        }
    }
    
    func fetchMovies(page: Int, section: UrlParameter, query: String, _ completion: @escaping(Result<[Movie], ProviderError>) -> Void) {
        guard let url = URL(string: "\(api)\(section.section)?api_key=\(apiKey)&language=\(language)\(query)&page=\(page)&region=\(region)") else { return }
        print(section)
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let requestData = try decoder.decode(MoviesResults.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(requestData.results))
                }
            }
            catch let error {
                print("\(error) URLSession fetchAnother")
            }
        }.resume()
    }
}
