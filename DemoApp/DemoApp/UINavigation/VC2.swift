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
    @IBOutlet weak var lblMessage: UILabel!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = message
    }
}
