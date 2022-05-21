//
//  URLSessionProviderSeparado.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 17/5/22.
// TODO: NO SÉ SEPARARLO. Y QUE NO PIDA PARAMETROS DE ENTRADA

import Foundation

class URLSessionProviderSeparado {
    
    private let requestBuilder: MoviesURLBuilder
    private let parser: MoviesParser
    
    init(requestBuilder: MoviesURLBuilder, parser: MoviesParser) {
        self.requestBuilder = requestBuilder
        self.parser = parser
    }

    func fetchMovies(apiSection: String, query: String?, page: Int, completion: @escaping([Movie]) -> Void) {
        let request = requestBuilder.getURL(apiSection: apiSection, query: query, page: page)
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            
            guard let self = self,
                  let data = data else {
                completion([])
                return
            }
            completion(self.parser.parse(data: data).results)
        }
        dataTask.resume()
    }
}


/*
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
 */
