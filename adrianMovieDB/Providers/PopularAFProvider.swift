//
//  PopularAFProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation

import Alamofire
class PopularAFProvider: PopularProviderContract {
    
    func fetchPopular(_ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=1ed1b35f1dd69fbc9fdce2d768e3e870&language=en-US&page=1") else {
            completion(.failure(.badUrl))
            return
        }
        let request = URLRequest(url: url)
        AF.request(request).responseDecodable(of: [Movie].self, decoder: JSONDecoder()) { (response: DataResponse<[Movie], AFError>) in
            switch response.result {
            case .success(let movies): completion(.success(movies))
            case .failure(let error):
                print("\(error)")
                completion(.failure(.generic(error)))
            }
        }.validate()
    }
    
}
