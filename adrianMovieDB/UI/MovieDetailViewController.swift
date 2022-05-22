//
//  MovieDetailViewController.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 21/5/22.
//

import UIKit

struct MovieDetailViewModel {
    let originalTitle: String
    let id: Int
    let year: String?
    let isFavorite: Bool
    let image: String?
    let title: String
    let overview: String
}

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var isFavoriteImage: UIImageView!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var viewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension MovieDetailViewController {
    func configure() {
        originalTitleLabel.text = viewModel?.originalTitle
        idLabel.text = "\(viewModel?.id ?? 0)"
        yearLabel.text = viewModel?.year
     isFavoriteImage.image = viewModel!.isFavorite ? (UIImage(systemName: "star.fill")) : (UIImage(systemName: "star"))

        titleLabel.text = viewModel?.title
        overviewLabel.text = viewModel?.overview
        
        imageLabel.loadImageUsingCache(withUrl: viewModel?.image ?? "")
        print("\(String(describing: viewModel?.image))")
    }
    
    static func create() -> MovieDetailViewController {
        return UIStoryboard(name: "MovieDetailViewController", bundle: .main).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
    }
}
