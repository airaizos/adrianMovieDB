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
        presenter?.didSearch(with: searchText)
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
