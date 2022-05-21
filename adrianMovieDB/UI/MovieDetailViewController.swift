//
//  MovieDetailViewController.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 21/5/22.
//

import UIKit

struct MovieDetailViewModel {
    let originalTitle: String
    let id: String
    let year: String?
    let isFavorite: String
    let image: URL?
    let title: String
    let overview: String
}

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var isFavoriteLabel: UILabel!
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
        idLabel.text = viewModel?.id
        yearLabel.text = viewModel?.year
        isFavoriteLabel.text = viewModel?.isFavorite
        titleLabel.text = viewModel?.title
        overviewLabel.text = viewModel?.overview
        imageLabel.load(url: viewModel?.image ?? URL(string: "tmdb")!)
    }
}
