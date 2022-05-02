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
    
    var numMovies: Int {
        if filteredMovies == nil {
            return movies.count
        } else {
            return filteredMovies.count
        }
    }
    
    private var filteredMovies: [Movie]!
    
    private var movies = [Movie]() {
        didSet {
            filteredMovies = movies
            view?.reloadData()
        }
    }
    
    private var favoritesMovies = [Int]()
    
    func cellViewModel(at IndexPath: IndexPath) -> MovieViewCellModel {
        let movie = filteredMovies[IndexPath.row]
        return movie.toTableCellViewModel
    }
    
    func viewDidLoad() {
        fetchMovies()
    }
    
    func fetchMovies() {
        interactor?.output = self
        interactor?.fetchMovies()
    }
}

extension PopularPresenter: PopularOutputContract {
    
    func didFetchFail(movies: [Movie]) {
        self.movies = movies
    }
    func didFetch(movies: [Movie]) {
        self.movies = movies
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
        
        if !favoritesMovies.contains(movie.id) {
            favoritesMovies.append(movie.id)
            
            view?.setFavorite(true, at: indexPath)
        }
    }
}
