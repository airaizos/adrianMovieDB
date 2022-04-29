//
//  PopularContract.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit

protocol PopularViewControllerContract {
    var presenter: PopularPresenterContract? { get set }
    func viewDidload()
    func createFromStoryboard() -> PopularViewController
}

protocol PopularPresenterContract {
    var view: PopularViewControllerContract? { get set }
    var interactor: PopularInteractorContract? {  get set }
    var wireframe: PopularWireframeContract? {  get set }
}

protocol PopularInteractorContract {
    var PopularProvider: PopularProviderContract? { get set }
}

protocol PopularWireframeContract {
    var view: UIViewController? { get set }
    func navigateTo()
}

protocol PopularProviderContract {
    func fetchPopular()
    
}
