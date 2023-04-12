//
//  MovieListingTVCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/05/23.
//

import UIKit

class MovieListingTVCell: UITableViewCell {
    // MARK: - Variables
    static var identifier = "MovieListingTVCell"

    // MARK: - IB Outlets
    @IBOutlet private weak var lblMovieTitle: UILabel!
    @IBOutlet weak var imgMovie: CircularImageView!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: - Functions
extension MovieListingTVCell {
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(with movie: Movie) {
        lblMovieTitle.text = movie.title
        imgMovie.image = movie.image
    }
}
