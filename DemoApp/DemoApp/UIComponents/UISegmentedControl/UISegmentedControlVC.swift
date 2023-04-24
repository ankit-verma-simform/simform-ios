//
//  UISegmentedControlVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/04/23.
//

import UIKit

class UISegmentedControlVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var scFavourite: UISegmentedControl!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IB Actions
extension UISegmentedControlVC {
    @IBAction private func scFavouriteChangeAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: print("Facebook")
        case 1: print("Google")
        case 2: print("Youtube")
        default: print("None")
        }
    }
}
