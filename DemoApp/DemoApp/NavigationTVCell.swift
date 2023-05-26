//
//  NavigationTVCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 16/05/23.
//

import UIKit

// MARK: - Protocols
protocol SendIndexPath: AnyObject {
    func didTapWithIndexPath(indexPath: IndexPath)
}

class NavigationTVCell: UITableViewCell {
    // MARK: - Variables
    static let identifier = "NavigationTVCell"
    private var indexPath = IndexPath()
    
    weak var delegate: SendIndexPath?

    // MARK: - IB Outlets
    @IBOutlet weak var btnNavigate: UIButton!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - IB Actions
extension NavigationTVCell {
    @IBAction private func btnNavigateAction(_ sender: UIButton) {
        delegate?.didTapWithIndexPath(indexPath: indexPath)
    }
}

// MARK: - Functions
extension NavigationTVCell {
    func configure(with title: String, indexPath: IndexPath) {
        btnNavigate.setTitle(title, for: .normal)
        self.indexPath = indexPath
    }
}
