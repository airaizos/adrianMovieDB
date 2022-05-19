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
                //let origen = Bundle.main.bundleURL.appendingPathComponent("FavoritesMovies.plist")
                let origen = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let ruta = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                try FileManager.default.copyItem(at: origen, to: ruta)
                print("FavoritesMovies.plist: COPIADO")
                
                let data = try Data(contentsOf: ruta)
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
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let moviesPath = documentsPath.appendingPathComponent("userFavoriteMovies").appendingPathExtension("plist")
        dataSourceURL = moviesPath
        
    }
    func getFavorite(_ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
        DispatchQueue.main.async {
            completion(.success(self.userFavoritesMovies))
        }
    }
}
