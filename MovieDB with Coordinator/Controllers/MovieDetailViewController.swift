//
//  MovieDetailViewController.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

//
// MARK: - Movie Detail View Controller
//
class MovieDetailViewController: UIViewController, Storyboarded {

    //
    // MARK: - Variables And Properties
    //
    weak var coordinator: MainCoordinator?
    var movie: Movie?

    //
    // MARK: - Outlets
    //
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //
    // MARK: - View Controller
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure(movie: movie)
    }
    
    func configure(movie: Movie?) {
        coverImage.image = movie?.poster
        coverImage.layer.cornerRadius = 10
        titleLabel.text = movie?.title
        
        var genresStr: String = ""
        if let genres = movie?.genres {
            for genre in genres {
                if !genresStr.isEmpty {
                    genresStr += ", " + genre
                } else {
                    genresStr = genre
                }
            }
        }
        
        genresLabel.text = genresStr
        rateLabel.text = "\(movie?.rating ?? 0)"
        descriptionLabel.text = movie?.description
        
    }

}
