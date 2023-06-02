//
//  ColorAViewController.swift
//  DelegateExample
//
//  Created by Ankit Verma on 13/03/23.
//

import UIKit

class ColorAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSelectColorPressed(_ sender: UIButton) {
        print("Select Color Button Pressed!")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let selectColorViewController = storyboard.instantiateViewController(withIdentifier: "ColorBViewController") as? ColorBViewController else {
            return
        }
        selectColorViewController.delegate = self
        navigationController?.pushViewController(selectColorViewController, animated: true)
    }
}

extension ColorAViewController: Colorable {
    func changeBackgroundColor(color: UIColor?) {
        if color != nil {
            view.backgroundColor = color
        }
    }
}
