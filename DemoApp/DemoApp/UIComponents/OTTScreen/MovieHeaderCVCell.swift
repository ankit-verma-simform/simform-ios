//
//  MovieHeaderCVCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 02/05/23.
//

import UIKit

class MovieHeaderCVCell: UICollectionViewCell {
    // MARK: - IB Outlets
    @IBOutlet private weak var imgTrending: UIImageView!
    static let identifier = "MovieHeaderCVCell"
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Functions
extension MovieHeaderCVCell {
    func configure(with movie: Movie) {
        imgTrending.image = movie.image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
