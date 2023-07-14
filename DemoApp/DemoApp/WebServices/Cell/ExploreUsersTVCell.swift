//
//  ExploreUsersTVCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/07/23.
//

import UIKit

class ExploreUsersTVCell: UITableViewCell {
    // MARK: - IB Outlets
    @IBOutlet private weak var lblUsername: UILabel!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Functions
extension ExploreUsersTVCell {
    func configure(with user: ExploreUser) {
        
    }
}

