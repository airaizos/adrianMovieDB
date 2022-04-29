//
//  FavoritesViewController.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    var presenter: FavoritesPresenterContract?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension FavoritesViewController: FavoritesViewControllerContract {
    
   static  func createFromStoryboard() -> FavoritesViewController {
        
       return UIStoryboard(name: "FavoritesViewController", bundle: .main).instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
    }
}
