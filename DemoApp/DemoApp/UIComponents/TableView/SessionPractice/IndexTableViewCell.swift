//
//  IndexTableViewCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 24/04/23.
//

import UIKit

class IndexTableViewCell: UITableViewCell {
    // MARK: - IB Outlets
    @IBOutlet private weak var lblIndex: UILabel!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("row initialized!")
    }
}
