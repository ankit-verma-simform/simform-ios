//
//  CustomView.swift
//  DelegateExample
//
//  Created by Ankit Verma on 13/03/23.
//

import Foundation
import UIKit

protocol TextTransferDelegate: AnyObject {
    func transferText(text: String)
}

class CustomView: UIView {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    weak var delegate: TextTransferDelegate?
    
    @IBAction func changeTextPressed(_ sender: UIButton) {
        guard let delegate else {
            return
        }
        
        delegate.transferText(text: textField.text ?? "no text written!")
    }
}
