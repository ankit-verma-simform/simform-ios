//
//  CustomControlsVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 14/07/23.
//

import UIKit

class CustomControlsVC: UIViewController {
    // MARK: - Variables
    @IBOutlet private weak var rangeSlider: RangeSlider!
    @IBOutlet private weak var lblRange: UILabel!
    @IBOutlet private weak var designableTextField: DesignableTextField!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        designableTextField.delegate = self
    }
}

// MARK: - Functions
extension CustomControlsVC {
    @IBAction private func onValueChangeAction(_ sender: RangeSlider) {
        let values = "(\(rangeSlider.lowerValue) \(rangeSlider.upperValue))"
        print("Range slider value changed: \(values)")
        lblRange.text = String(format: "Current Range: %.2f - %.2f", rangeSlider.lowerValue, rangeSlider.upperValue)
    }
}

// MARK: - Designable TextField Icon Delegate
extension CustomControlsVC: DesignableTextFieldDelegate {
    func textFieldIconClicked(btn: UIButton) {
        print("Icon Clicked!")
    }
}
