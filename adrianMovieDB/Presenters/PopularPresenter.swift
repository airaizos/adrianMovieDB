//
//  PopularPresenter.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit

class PopularPresenter: PopularPresenterContract {
    var view: PopularViewControllerContract?
    var interactor: PopularInteractorContract?
    var wireframe: PopularWireframeContract?
    var favoriteProvider: FavoritesFileManagerStorage?
    var isSearching = false
    
    var numMovies: Int {
        if filteredMovies == nil {
            return movies.count
        } else {
            return filteredMovies.count
        }
    }
    
    private var movies = [Movie]() {
        didSet {
            filteredMovies = movies
            view?.reloadData()
        }
    }
    private var filteredMovies: [Movie]!
    private var favoritesMovies = [Movie]()
    
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel {
        let movie = filteredMovies[IndexPath.row]
        return movie.toTableCellViewModel
    }
    
    //MARK: FetchMore
    var page = 1
    var searchPage = 1
    
    func viewDidLoad() {
        fetchMovies()
    }
    
    func fetchMovies() {
        interactor?.output = self
        interactor?.fetchMovies(page: page, section: UrlParameter.popular,  query: "")
        isSearching = false
        self.page += 1
    }
}

extension PopularPresenter: PopularOutputContract {
    
    func didFetchFail(movies: [Movie]) {
        self.movies.append(contentsOf: movies)
    }
    func didFetch(movies: [Movie]) {
        self.movies.append(contentsOf: movies)
    }
    
    //MARK: Output Favorites
    func didUpdateFavorites(in movie: Movie, favorite: Bool) {
        guard let index = filteredMovies.firstIndex(of: movie) else {
            return }
        view?.setFavorite(true, at: IndexPath(row: index, section: 0))
    }
    
    func didSelectMovie(at indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        wireframe?.navigateTo(to: movie)
    }
}

//MARK: SearchBar
extension PopularPresenter {
    func didSearch(with searchText: String) {
        
        if searchPage == 1 {
            movies = []
        }
        
        filteredMovies = movies.filter { (movie: Movie) -> Bool in
            return movie.title.lowercased().contains(searchText.lowercased())
        }
        fetchSearchedMovies(with: searchText)
        view?.reloadData()
        
    }
    func fetchSearchedMovies(with searchText: String) {
        isSearching = true
        interactor?.fetchMovies(page: searchPage, section: UrlParameter.search, query: "&query=\(searchText)")
        searchPage += 1
    }
}

//MARK: Favorites
extension PopularPresenter {
    func didSelectFavorite(at indexPath: IndexPath) {
        let movie = filteredMovies[indexPath.row]
        
        if !favoritesMovies.contains(movie) {
            favoritesMovies.append(movie)
            favoriteProvider?.saveFavorite(movie)
            
            view?.setFavorite(true, at: indexPath)
        } else if let index = 
            favoritesMovies.firstIndex(of: movie) {
                favoritesMovies.remove(at: index)
            favoriteProvider?.removeFavoriteAt(index)
            view?.setFavorite(false, at: indexPath)
        }
    }
    
    func isFavorite(at indexPath: IndexPath) -> Bool {
        let movie = filteredMovies[indexPath.row]
        return favoritesMovies.contains(movie)
    }
}

extension PopularPresenter {
    func restartMovies() {
        page = 1
        searchPage = 1
        isSearching = false
        movies = [Movie]()
        filteredMovies = movies
        view?.viewDidLoad()
    }
}
