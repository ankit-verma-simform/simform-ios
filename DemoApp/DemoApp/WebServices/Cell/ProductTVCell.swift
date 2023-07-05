//
//  ProductTVCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 29/06/23.
//

import UIKit
import Kingfisher

class ProductTVCell: UITableViewCell {
    // MARK: - IB Outlets
    @IBOutlet weak var lblProductTitle: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Functions
extension ProductTVCell {
    func config(with product: Product) {
        lblProductTitle.text = product.title
        imgProduct.kf.setImage(with: URL(string: product.thumbnail))
    }
}
