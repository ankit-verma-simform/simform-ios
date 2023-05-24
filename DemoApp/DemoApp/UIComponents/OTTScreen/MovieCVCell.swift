//
//  MovieCVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 01/05/23.
//

import UIKit
import SDWebImage

class MovieCVCell: UICollectionViewCell {
    // MARK: - Variables
    static let identifier = "MovieCVCell"

    // MARK: - IB Outlets
    @IBOutlet private weak var imgMovie: UIImageView!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Functions
extension MovieCVCell {
    static func nib() -> UINib {
        return UINib(nibName: "MovieCVCell", bundle: nil)
    }
    
    func configure(with movie: MovieItem) {
        print(movie)
        if let validMoviePosterUrl = movie.poster {
            imgMovie.sd_setImage(with: URL(string: validMoviePosterUrl),
                                 placeholderImage: UIImage(named: UIImage.placeholder))
        } else {
            imgMovie.image = UIImage(named: UIImage.placeholder)
        }
        imgMovie.layer.cornerRadius = 20
    }
}
