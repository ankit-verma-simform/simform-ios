//
//  UITextField+Extension.swift
//  DemoApp
//
//  Created by Ankit Verma on 05/05/23.
//

import UIKit

extension UITextField {
    func addDoneButtonOnInputView() {
        let doneToolbar: UIToolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(self.doneButtonAction))
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
