//
//  UISliderVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/04/23.
//

import UIKit

class UISliderVC: UIViewController {
    // MARK: IB Outlets
    @IBOutlet private weak var lblSlider: UILabel!
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IB Actions
extension UISliderVC {
    @IBAction private func slider(_ sender: UISlider) {
        lblSlider.text = String(Int(sender.value))
    }
}
