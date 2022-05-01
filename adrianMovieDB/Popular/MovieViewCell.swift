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
    @IBOutlet weak var favoriteImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

    func configure(with cellViewModel: MovieViewCellModel) {
        movieTitle.text = cellViewModel.title
        yearLabel.text = cellViewModel.year
        favoriteImage.image = cellViewModel.favorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        
    }
    
}
