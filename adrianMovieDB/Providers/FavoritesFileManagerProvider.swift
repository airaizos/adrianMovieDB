//
//  FavoritesProvider.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation

class FavoritesFileManagerProvider: FavoritesProviderContract {
    func copyFavorites(_ movies: [Movie]) {
        
    }
    
    func saveFavorite(_ movie: Movie) {
        
    }
    
    func removeFavoriteAt(_ index: Int) {
        
    }
    
    func getFavorites(_ completion: @escaping (Result<[Movie], ProviderError>) -> Void) {
        
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
