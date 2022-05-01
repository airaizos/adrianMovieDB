//
//  PrototypeCell.swift
//  adrianMovieDB
//
//  Created by Adrian Iraizos Mendoza on 1/5/22.
//

import UIKit

class PrototypeCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var labelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(with  cellViewModel: MovieViewCellModel) {
        
        titleLabel.text = cellViewModel.title
        labelLabel.text = cellViewModel.year
    }
    
}
