//
//  FavoritesViewController.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//TODO: obtener ids y mostrar peliculas

import UIKit

class FavoritesViewController: UIViewController {
    var presenter: FavoritesPresenterContract?
    
    func reloadData() {
        DispatchQueue.main.async {
            self.favoritesMoviesTableView.reloadData()
        }
    }

    @IBOutlet weak var favoritesMoviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        presenter?.numMovies ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cellViewModel = presenter?.cellViewModel(at: indexPath), let cell = favoritesMoviesTableView.dequeueReusableCell(withIdentifier: "movieViewCell", for: indexPath) as? MovieViewCell else {
            fatalError()
        }
        cell.configure(with: cellViewModel)
        return cell
    }
    
}


extension FavoritesViewController: FavoritesViewControllerContract {

   static  func createFromStoryboard() -> FavoritesViewController {
        
       return UIStoryboard(name: "FavoritesViewController", bundle: .main).instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
    }

}
