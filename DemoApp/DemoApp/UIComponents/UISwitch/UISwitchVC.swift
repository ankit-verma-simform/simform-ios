//
//  UISwitchVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/04/23.
//

import UIKit

class UISwitchVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var lblDarkMode: UILabel!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IB Actions
extension UISwitchVC {
    @IBAction private func switchToggleDarkMode(_ sender: UISwitch) {
        print(sender.isOn)
        if sender.isOn {
            overrideUserInterfaceStyle = .dark
            lblDarkMode.text = "Turn off Dark Mode"
        } else {
            overrideUserInterfaceStyle = .light
            lblDarkMode.text = "Turn on Dark Mode"
        }
    }
}
