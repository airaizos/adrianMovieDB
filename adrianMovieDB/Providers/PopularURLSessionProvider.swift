//
//  PopularURLSessionProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 1/5/22.
//

import Foundation

enum APISection {
    case popular, search
    
    var section: String {
        switch self {
        case .popular: return "movie/popular"
        case .search: return "search/movie"
        }
    }
}

class PopularURLSessionProvider: PopularProviderContract {
    let api = "https://api.themoviedb.org/3/"
    let apiKey = "1ed1b35f1dd69fbc9fdce2d768e3e870"
    let language = "en-US"

    //falta el quyery
    func fetchMovies(page: Int, section: APISection, _ completion: @escaping(Result<[Movie], ProviderError>) -> Void) {
        guard let url = URL(string: "\(api)\(section.section)?api_key=\(apiKey)&language=\(language)&page=\(page)") else { return }
        //porque devuelve solo popular?
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
