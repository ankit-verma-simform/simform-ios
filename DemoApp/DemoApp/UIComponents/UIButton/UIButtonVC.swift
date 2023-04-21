//
//  UIButtonVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 12/04/23.
//

import UIKit

class UIButtonVC: UIViewController {
    // MARK: Variables
    private var squareIsRed: Bool = true
    
    // MARK: IB Outlets
    @IBOutlet private weak var btnChangeColor: UIButton!
    @IBOutlet private weak var viewSquare: UIView!
    @IBOutlet private weak var btnAddButton: UIButton!
    @IBOutlet private weak var btnFreeTrial: UIButton!
    
    // MARK: IB OutletCollection
    @IBOutlet private var typeButtonCollection: [UIButton]!
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in typeButtonCollection {
            button.setTitleColor(.magenta, for: .normal)
        }
        btnFreeTrial.configuration = .freeTrial()
    }
}

// MARK: IB Actions
extension UIButtonVC {
    @IBAction private func btnChangeColorAction(_ sender: Any) {
        viewSquare.backgroundColor = squareIsRed ? .orange : .red
        let colorName = squareIsRed ? "Red" : "Orange"
        btnChangeColor.setTitle("Click to set square color to \(colorName)", for: .normal)
        squareIsRed = !squareIsRed
    }
    
    @IBAction private func btnAddButtonAction(_ sender: UIButton) {
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
    
    @IBAction private func btnTouchUpInside(_ sender: UIButton, forEvent event: UIEvent) {
        switch event.type {
        case .hover: print("Hover state")
        case .motion: print("Device is moving")
        case .remoteControl: print("Uses remote control")
        case .presses: print("Pressed button")
        case .touches: print("Button is touched")
        case .scroll: print("Scrolled")
        case .transform: print("Transformed")
        @unknown default: print("Unknown event type")
        }
    }
    
    @IBAction func btnTouchUpOutside(_ sender: UIButton) {
        print("btn touched outside")
        // called when user clicks button but then moves outside and leave
    }
    
    @IBAction func btnTouchDragEnter(_ sender: Any) {
        print("btn touch drag enter")
    }
    
    @IBAction func btnTouchDown(_ sender: UIButton) {
        print("Touch down event")
    }
}

// MARK: Extensions
extension UIButton.Configuration {
    static func freeTrial() -> UIButton.Configuration {
        var config: UIButton.Configuration = .tinted()
        config.baseBackgroundColor = .green
        config.baseForegroundColor = .gray
        config.title = "Free Trial"
        return config
    }
}
