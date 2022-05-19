//
//  FavoritesFileManagerProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 18/5/22.
//
//obtener de aqui los favoritos guardados
import Foundation

class FavoriteFileManagerProvider: FavoritesProviderContract {
    private let dataSourceURL: URL
    private var userFavoritesMovies: [Movie] {
        get {
            do {
                let decoder = PropertyListDecoder()
//                let origen = Bundle.main.bundleURL.appendingPathComponent("FavoritesMovies.plist")
 //               let ruta = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//                try FileManager.default.copyItem(at: origen, to: ruta)
//                print("Ruta:\(ruta)COPIADO")
                
                let data = try Data(contentsOf: dataSourceURL)
                
                let decodedMovies = try! decoder.decode([Movie].self, from: data)
                return decodedMovies
            } catch {
                print(dataSourceURL)
                print("error grave al copiar FavoritesMovies.plist \(error.localizedDescription)")
            }
            return []
        }
    }
    
    init() {
 //       let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let documentsPath = Bundle.main.bundleURL
        let moviesPath = documentsPath.appendingPathComponent("FavoritesMovies").appendingPathExtension("plist")
        dataSourceURL = moviesPath
        print("moviesPath:\(moviesPath)")
        
    }
     
    func getFavorite(_ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
        DispatchQueue.main.async {
            completion(.success(self.userFavoritesMovies))
        }
    }
}
