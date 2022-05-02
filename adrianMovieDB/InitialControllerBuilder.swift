//
//  InitialControllerBuilder.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 28/4/22.
//

import Foundation
import UIKit

class InitialControllerBuilder {
    func build() -> UIViewController {
        let tabBarController = UITabBarController()
        let viewControllers = [buildPopular(),buildFavorites()]
        tabBarController.setViewControllers(viewControllers, animated: true)
        return tabBarController
    }
}

extension InitialControllerBuilder {
    func buildPopular() -> UINavigationController {
        let viewController = PopularControllerBuilder().build()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(systemName: "film", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.init(named: "textSecondary") ?? .black, renderingMode: .alwaysOriginal), tag: 0)
        return navigationController
    }
    
}

extension InitialControllerBuilder {
    func buildFavorites() -> UINavigationController {
        let viewController = FavoritesControllerBuilder().build()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.init(named: "textSecondary") ?? .black, renderingMode: .alwaysOriginal), tag: 1)
        return navigationController
    }
}
