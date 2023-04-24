//
//  ImageViewVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/04/23.
//

import UIKit

class ImageViewVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var ivLogo: UIImageView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        modifyImage()
    }
}

// MARK: - Functions
extension ImageViewVC {
    private func modifyImage() {
        ivLogo.layer.cornerRadius = 50
    }
}
