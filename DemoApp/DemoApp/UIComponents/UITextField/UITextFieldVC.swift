//
//  UITextFieldVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 13/04/23.
//

import UIKit

class UITextFieldVC: UIViewController {
    // MARK: IB Outlets
    @IBOutlet private weak var tfEnterPassword: UITextField!

    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: UI Actions
extension UITextFieldVC {
    @IBAction private func tfCheckUserInputAction(_ sender: UITextField) {
        guard let newText = sender.text else {
            return
        }
        sender.backgroundColor = .systemBackground
        sender.layer.borderWidth = 1
        if newText.isEmpty {
            return
        }
        if newText.count < 8 {
            sender.layer.borderColor = UIColor.red.cgColor
        } else {
            sender.layer.borderColor = UIColor.green.cgColor
        }
    }
    
    @IBAction private func btnToggleShowPassword(_ sender: UIButton) {
        tfEnterPassword.isSecureTextEntry = !tfEnterPassword.isSecureTextEntry
        if tfEnterPassword.isSecureTextEntry {
            sender.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
}
