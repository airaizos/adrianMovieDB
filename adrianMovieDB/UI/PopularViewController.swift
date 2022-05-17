//
//  PopularViewController.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import UIKit

class PopularViewController: UIViewController {
    
    var presenter: PopularPresenterContract?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var popularTableView: UITableView!
    
    func reloadData(){
        
        DispatchQueue.main.async {
            self.popularTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularTableView.dataSource = self
        popularTableView.delegate = self
        presenter?.viewDidLoad()
        searchBar.delegate = self
    }
}

extension PopularViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numMovies ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellViewModel = presenter?.cellViewModel(at: indexPath), let cell = popularTableView.dequeueReusableCell(withIdentifier: "movieViewCell", for: indexPath) as? MovieViewCell else {
            
            fatalError()
        }
        cell.delegate = self
        cell.isFavorite = presenter?.isFavorite(at: indexPath) ?? false
        cell.configure(with: cellViewModel)
        return cell
    }
    
}

extension PopularViewController: PopularViewControllerContract {
    
    static func createFromStoryboard() -> PopularViewController {
        return UIStoryboard(name: "PopularViewController", bundle: .main).instantiateViewController(withIdentifier: "PopularViewController") as! PopularViewController
    }
}

//MARK: SearchBar
extension PopularViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
        perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0.5)
    }
    @objc func reload(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
            print("nada que buscar")
            return
        }
        if let term = searchBar.searchTextField.text {
            presenter?.didSearch(with: term)
            presenter?.searchPage = 1
            presenter?.isSearching = true
        }
    }
}

// MARK: Favorites
extension PopularViewController: PopularTableViewDelegate {
    func didPressInFavorite(cell: MovieViewCell) {
        guard let indexPath = popularTableView.indexPath(for: cell) else { return }
        presenter?.didSelectFavorite(at: indexPath)
    }
    
    func setFavorite(_ favorite: Bool, at indexPath: IndexPath) {
        DispatchQueue.main.async {
            guard let cell = self.popularTableView.cellForRow(at: indexPath) as? MovieViewCell else {  return }
            cell.isFavorite = favorite
        }
    }
}

//MARK: Scroll
extension PopularViewController {
    
    func fetchMovies() {
        presenter?.fetchMovies()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currenOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        //TODO: Cómo saber cuando es de la barra y cuando es de las popular movies
        if maximumOffset - currenOffset <= 50 {
            
            if presenter?.isSearching == true {
                //total pages
            } else {           self.fetchMovies()
            }
        }
    }
}


