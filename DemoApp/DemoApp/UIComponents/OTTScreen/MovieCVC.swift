//
//  MovieCVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 01/05/23.
//

import UIKit
import SDWebImage

class MovieCVC: UICollectionViewCell {
    // MARK: - Variables
    static let identifier = "MovieCVC"

    // MARK: - IB Outlets
    @IBOutlet private weak var imgMovie: UIImageView!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Functions
extension MovieCVC {
    static func nib() -> UINib {
        return UINib(nibName: "MovieCVC", bundle: nil)
    }
    
    func configure(with movie: MovieItem) {
        print(movie)
        if let validMoviePosterUrl = movie.poster {
            imgMovie.sd_setImage(with: URL(string: validMoviePosterUrl),
                                 placeholderImage: UIImage(named: "placeholder"))
        } else {
            imgMovie.image = UIImage(named: "placeholder")
        }
        imgMovie.layer.cornerRadius = 20
    }
}
