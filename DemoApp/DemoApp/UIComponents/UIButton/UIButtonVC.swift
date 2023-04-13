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
    @IBOutlet weak var btnAddButton: UIButton!
    
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
        squareIsRed = !squareIsRed
    }
    
    @IBAction func btnAddButtonAction(_ sender: UIButton) {
        // setting up button
        let newBtn = UIButton()
        newBtn.setTitle("This button added programmatically", for: .normal)
        newBtn.setTitleColor(.white, for: .normal)
        newBtn.isUserInteractionEnabled = true
        newBtn.backgroundColor = .systemGray4
        
        // adding button and constraints
        view.addSubview(newBtn)
        newBtn.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = newBtn.topAnchor.constraint(equalTo: sender.bottomAnchor, constant: 10)
        let horizontalConstraint = newBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, topConstraint])
    }
}
