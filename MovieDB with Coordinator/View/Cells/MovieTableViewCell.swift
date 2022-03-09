//
//  MovieTableViewCell.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

//
// MARK: - Movie Cell
//

class MovieTableViewCell: UITableViewCell {
    
    //
    // MARK: Outlets
    //
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    //
    // MARK: - Table View Cell
    //
    override func prepareForReuse() {
        super.prepareForReuse()
      
        titleLabel.text = nil
        subtitleLabel.text = nil
        rateLabel.text = nil
        coverImageView.image = nil
    }

}

