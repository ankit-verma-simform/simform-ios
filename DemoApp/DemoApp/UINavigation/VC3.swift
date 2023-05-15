//
//  VC3.swift
//  DemoApp
//
//  Created by Ankit Verma on 15/05/23.
//

import UIKit

class VC3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func popUpVC(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
