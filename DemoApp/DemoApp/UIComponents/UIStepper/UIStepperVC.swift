//
//  UIStepperVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/04/23.
//

import UIKit

class UIStepperVC: UIViewController {

    // MARK: IB Outlets
    @IBOutlet weak var lblStepper: UILabel!
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IB Actions
extension UIStepperVC {
    @IBAction func stepper(_ sender: UIStepper) {
        lblStepper.text = String(sender.value)
    }
}
