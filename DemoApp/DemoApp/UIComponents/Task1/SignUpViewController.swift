//
//  SignUpViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/04/23.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: IB Outlets
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var constImgWidth: NSLayoutConstraint!
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        ivProfile.layer.cornerRadius = ivProfile.frame.size.height / 2
        ivProfile.clipsToBounds = true
//        ivProfile.maskCircle()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.constImgWidth.constant = 250
            self.ivProfile.layoutIfNeeded()
            self.ivProfile.layer.cornerRadius = self.ivProfile.frame.size.height / 2
//            print("called")
        }
    }
}
