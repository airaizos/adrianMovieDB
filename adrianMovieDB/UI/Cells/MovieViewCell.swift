//
//  MovieViewCell.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 29/4/22.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate: PopularTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with cellViewModel: MovieViewCellModel) {
        
        movieTitle.text = cellViewModel.title
        yearLabel.text = cellViewModel.year
    }
    
    @IBAction func favoritePressed(_ sender: UIButton) {
        delegate?.didPressInFavorite(cell: self)
    }
    
    var isFavorite = false {
        didSet {
            if isFavorite {
                favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            } else {
                favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            }
        }
    }
}


