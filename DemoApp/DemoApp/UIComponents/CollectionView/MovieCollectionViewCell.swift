//
//  MovieCollectionViewCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 01/05/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    // MARK: - IB Outlets
    @IBOutlet private weak var lblMovieTitle: UILabel!
    @IBOutlet private weak var imgMovie: UIImageView!
    
    // MARK: - View Lifecycle Methods
    func setup(movie: Movie) {
        lblMovieTitle.text = movie.title
        imgMovie.image = movie.image
    }
}
