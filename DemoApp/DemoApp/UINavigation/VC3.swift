//
//  VC3.swift
//  DemoApp
//
//  Created by Ankit Verma on 15/05/23.
//

import UIKit

class VC3: UIViewController {
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IB Actions
extension VC3 {
    @IBAction private func dismissVC(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction private func popUpVC(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

