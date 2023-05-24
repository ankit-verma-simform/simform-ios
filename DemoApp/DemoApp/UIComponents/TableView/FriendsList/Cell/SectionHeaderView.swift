//
//  SectionHeaderView.swift
//  DemoApp
//
//  Created by Ankit Verma on 28/04/23.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {
    // MARK: - IB Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    // MARK: - Properties
    override var reuseIdentifier: String? { "SectionHeaderView" }
}

// MARK: - Functions
extension SectionHeaderView {
    func config(sectionTitle: String) {
        lblTitle.text = sectionTitle
        containerView.layer.cornerRadius = 10
    }
}
