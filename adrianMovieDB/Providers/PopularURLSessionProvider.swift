//
//  PopularURLSessionProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 1/5/22.
//

import Foundation


class PopularURLSessionProvider: PopularProviderContract {
    func fetchPopular(_ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=1ed1b35f1dd69fbc9fdce2d768e3e870&language=en-US&page=1") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let requestData = try decoder.decode([Movie].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(requestData))
                }
            } catch let error {
                print("\(error) URLSession")
            }
        }.resume()
    }
}

//"Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil
