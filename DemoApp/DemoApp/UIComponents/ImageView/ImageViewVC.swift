//
//  ImageViewVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/04/23.
//

import UIKit

class ImageViewVC: UIViewController {

    // MARK: IB Outlets
    @IBOutlet weak var ivLogo: UIImageView!
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        modifyImage()
    }
}

extension ImageViewVC {
    // MARK: Functions
    func modifyImage() {
        ivLogo.layer.cornerRadius = 50
    }
}

