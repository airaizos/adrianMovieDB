//
//  FavoritesProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

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
    let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathExtension("\(fileName).plist")
        print("\(String(describing: url))")
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
            try print(String(contentsOf: fileURL!).utf8)
        } catch {
            print("Error al guardar \(error.localizedDescription)")
        }
    }
}
