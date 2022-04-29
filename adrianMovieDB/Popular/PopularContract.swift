//
//  PopularContract.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit

protocol PopularViewControllerContract: UIViewController {
    var presenter: PopularPresenterContract? { get set }
    func viewDidLoad()
    func reloadData()
    
   static func createFromStoryboard() -> PopularViewController
}

protocol PopularPresenterContract {
    var view: PopularViewControllerContract? { get set }
    var interactor: PopularInteractorContract? {  get set }
    var wireframe: PopularWireframeContract? {  get set }
    
    func viewDidLoad()
}

protocol PopularInteractorContract {
    var popularProvider: PopularProviderContract? { get set }
    
    func fetchMovies() 
}

protocol PopularWireframeContract {
    var view: UIViewController? { get set }
    func navigateTo()
}

protocol PopularProviderContract {
    func fetchPopular()
    
}
