//
//  UIButtonVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 12/04/23.
//

import UIKit

class UIButtonVC: UIViewController {
    
    // MARK: Variables
    var squareIsRed: Bool = true
    
    // MARK: IB Outlets
    @IBOutlet weak var btnChangeColor: UIButton!
    @IBOutlet weak var viewSquare: UIView!
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IB Actions
extension UIButtonVC {
    @IBAction func btnChangeColorAction(_ sender: Any) {
        viewSquare.backgroundColor = squareIsRed ? .orange : .red
        let colorName = squareIsRed ? "Red" : "Orange"
        btnChangeColor.setTitle("Click to set square color to \(colorName)", for: .normal)
        btnChangeColor.
        squareIsRed = !squareIsRed
    }
}
