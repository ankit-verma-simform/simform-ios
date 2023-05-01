//
//  MovieCollectionViewCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 01/05/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var lblMovieTitle: UILabel!
    @IBOutlet private weak var imgMovie: UIImageView!
    
    func setup(movie: Movie) {
        lblMovieTitle.text = movie.title
        imgMovie.image = movie.image
    }
}
