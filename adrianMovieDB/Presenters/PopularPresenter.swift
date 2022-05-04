//
//  PopularPresenter.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation

class PopularPresenter: PopularPresenterContract {
    var view: PopularViewControllerContract?
    var interactor: PopularInteractorContract?
    var wireframe: PopularWireframeContract?
    var favoriteProvider: FavoriteLocalProvider?
    
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
    // TODO: Index out of range movies ≭ filteredMovies
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel {
        let movie = filteredMovies[IndexPath.row]
        return movie.toTableCellViewModel
    }
    
    //MARK: FetchMore
    var page = 2
    let itemsPerBatch = 50
    var offset = 0
    var reachedEndOfItems = false
    
    func viewDidLoad() {
        fetchMovies()
    }
    
    func fetchMovies() {
        interactor?.output = self
        interactor?.fetchMovies()
    }
    func fetchMore() {
        interactor?.output = self
        interactor?.fetchAnother(page: page)
        view?.reloadData()
        //TODO: Se multiplican!!
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
}

//MARK: SearchBar
extension PopularPresenter {
    func didSearch(with searchText: String) {
        
        filteredMovies = []
        
        if searchText == "" {
            filteredMovies = movies
        } else {
            filteredMovies = movies.filter{ (movie: Movie) -> Bool in
                return movie.title.lowercased().contains(searchText.lowercased())
            }
        }
        view?.reloadData()
    }
}

//MARK: Favorites
extension PopularPresenter {
    func didSelectFavorite(at indexPath: IndexPath) {
        let movie = filteredMovies[indexPath.row]
        
        if !favoritesMovies.contains(movie) {
            favoritesMovies.append(movie)
  //          favoriteProvider?.saveFavorite(movie)
    //       favoriteProvider?.copyFavorites(self.favoritesMovies)
            favoriteProvider?.favoriteMovies = self.favoritesMovies
            
            view?.setFavorite(true, at: indexPath)
        } else if let index = filteredMovies.firstIndex(of: movie) {
            filteredMovies.remove(at: index)
            favoriteProvider?.removeFavoriteAt(index)
            view?.setFavorite(false, at: indexPath)
        }
    }
    
    func isFavorite(at indexPath: IndexPath) -> Bool {
        let movie = filteredMovies[indexPath.row]
        return favoritesMovies.contains(movie)
    }
}
