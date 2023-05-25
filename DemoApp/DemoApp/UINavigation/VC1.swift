//
//  VC1.swift
//  DemoApp
//
//  Created by Ankit Verma on 15/05/23.
//

import UIKit

class VC1: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var tfMessage: UITextField!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IB Actions
extension VC1 {
    @IBAction private func presentModallyVC(_ sender: Any) {
        guard let vc2 = VC2.create(storyboardName: .uiNavigation) as? VC2 else {
            return
        }
        vc2.message = tfMessage.text
        present(vc2, animated: true)
    }
    
    @IBAction private func pushVC(_ sender: Any) {
        guard let vc2 = VC2.create(storyboardName: .uiNavigation) as? VC2 else {
            return
        }
        vc2.message = tfMessage.text
        navigationController?.pushViewController(vc2, animated: true)
    }
}

