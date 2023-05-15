//
//  ThirdVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 15/05/23.
//

import UIKit

class FourthVC: UIViewController {
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IB Outlets
extension FourthVC {
    @IBAction func popUptoRootVC(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func popUptoSecondVC(_ sender: UIButton) {
        guard let viewControllers = navigationController?.viewControllers else {
            return
        }
        for viewController in viewControllers {
            if viewController.isKind(of: SecondVC.self) {
                navigationController?.popToViewController(viewController, animated: true)
                return
            }
        }
    }
}
