//
//  NavigationItemTVCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 16/05/23.
//

import UIKit

class NITVCell: UITableViewCell {
    // MARK: - IB Outlets
    @IBOutlet private weak var btnNavigate: UIButton!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Functions
extension NITVCell {
    func configure(with title: String) {
        btnNavigate.setTitle(title, for: .normal)
    }
}
