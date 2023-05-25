//
//  VC2.swift
//  DemoApp
//
//  Created by Ankit Verma on 15/05/23.
//

import UIKit

class VC2: UIViewController {
    // MARK: - Variables
    var message: String?
    
    // MARK: - IB Outlets
    @IBOutlet private weak var lblMessage: UILabel!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = message
    }
}

// MARK: - IB Actions
extension VC2 {
    @IBAction private func pushVC4(_ sender: UIButton) {
        guard let vc4 = VC4.create(storyboardName: .uiNavigation) as? VC4 else {
            return
        }
        navigationController?.pushViewController(vc4, animated: true)
    }
}
