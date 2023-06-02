//
//  ColorBViewController.swift
//  DelegateExample
//
//  Created by Ankit Verma on 13/03/23.
//

import UIKit

protocol Colorable: AnyObject {
    func changeBackgroundColor(color: UIColor?)
}

class ColorBViewController: UIViewController {
    
    weak var delegate: Colorable?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressedPinkColor(_ sender: UIButton) {
        print("Choosen pink color")
        delegate?.changeBackgroundColor(color: .systemPink)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pressedBlueColor(_ sender: UIButton) {
        print("Choosen blue color")
        delegate?.changeBackgroundColor(color: .systemCyan)
        navigationController?.popViewController(animated: true)
    }
}
