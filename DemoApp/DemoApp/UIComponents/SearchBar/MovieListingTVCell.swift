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
    @IBOutlet weak var lblMovieTitle: UILabel!
    
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
}
