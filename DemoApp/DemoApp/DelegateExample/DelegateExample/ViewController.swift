//
//  ViewController.swift
//  DelegateExample
//
//  Created by Ankit Verma on 13/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var customView: CustomView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customView = (Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView)
    }

    @IBAction func presentCustomView(_ sender: UIButton) {
        guard let customView else {
            return
        }
        customView.center = self.view.center
        customView.delegate = self
        self.view.addSubview(customView)
    }
    
}

extension ViewController: TextTransferDelegate {
    func transferText(text: String) {
        if !text.isEmpty {
            label.text = text
            customView?.removeFromSuperview()
        }
    }
}
