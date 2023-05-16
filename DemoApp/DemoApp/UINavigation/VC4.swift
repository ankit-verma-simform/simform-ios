//
//  VC4.swift
//  DemoApp
//
//  Created by Ankit Verma on 16/05/23.
//

import UIKit

class VC4: UIViewController {
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "VC 4"
    }
}

// MARK: - IB Actions
extension VC4 {
    @IBAction func popUptoRootVC(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
