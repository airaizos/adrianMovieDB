//
//  FavoritesProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//
//TODO: Problemas al añadir y borrar favoritas
import Foundation

class FavoritesFileManagerStorage: FavoritesStorageContract {
    func copyFavorites(_ movies: [Movie]) {
        self.favoriteMovies = movies
    }
    
    func saveFavorite(_ movie: Movie) {
        self.favoriteMovies.append(movie)
        saveFavorites(self.favoriteMovies)
    }
    
    func removeFavoriteAt(_ index: Int) {
        self.favoriteMovies.remove(at: index)
        saveFavorites(self.favoriteMovies)
        print(favoriteMovies[index])
        print(favoriteMovies.count)
        print(favoriteMovies[index].title)
    }
    
    func getFavorites(_ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
        let favoritesMovies = [Movie]()
        completion(.success(favoritesMovies))
    }
    
    var favoriteMovies = [Movie]()
    
    private let fileManager: FileManager
    private let fileName: String
    
    init(fileManager: FileManager = FileManager.default, fileName: String = "FavoritesMovies") {
        self.fileManager = fileManager
        self.fileName = fileName
    }
    
    private var fileURL: URL? {
        let url = Bundle.main.bundleURL.appendingPathComponent("FavoritesMovies").appendingPathExtension("plist")
            return url
    }
    
    func saveFavorites(_ movies: [Movie]) {
        guard let url = fileURL else {
            return
        }
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(movies)
            try data.write(to: url)
        } catch {
            print("Error al guardar \(error.localizedDescription)")
        }
    }
}
