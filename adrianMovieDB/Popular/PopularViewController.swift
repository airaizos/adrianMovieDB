//
//  PopularViewController.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import UIKit

class PopularViewController: UIViewController {
    var presenter: PopularPresenterContract?
    
   
    func reloadData(){
        //TODO: Volviendo con el local provider a ViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension PopularViewController: PopularViewControllerContract {

    
   static func createFromStoryboard() -> PopularViewController {
       return UIStoryboard(name: "PopularViewController", bundle: .main).instantiateViewController(withIdentifier: "PopularViewController") as! PopularViewController
   }
}
