//
//  UIProgressVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/04/23.
//

import UIKit

class UIProgressViewVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var pvLoading: UIProgressView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        pvLoading.progress = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        progressLoading()
    }
}

// MARK: - Functions
extension UIProgressViewVC {
    private func progressLoading() {
        while pvLoading.progress < 1 {
            pvLoading.progress += 0.1
        }
    }
}
