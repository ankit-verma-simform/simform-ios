//
//  UISliderVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/04/23.
//

import UIKit

class UISliderVC: UIViewController {

    @IBOutlet weak var lblSlider: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func slider(_ sender: UISlider) {
        lblSlider.text = String(Int(sender.value))
    }
}
