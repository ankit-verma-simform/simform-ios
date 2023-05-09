//
//  UIDatePickerVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 05/05/23.
//

import UIKit

class UIDatePickerVC: UIViewController {
    // MARK: - Variables
    private var datePicker: UIDatePicker = UIDatePicker(frame: .zero)
    
    // MARK: - IB Outlets
    @IBOutlet private weak var tfPickDate: UITextField!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension UIDatePickerVC {
    private func initialSetup() {
        tfPickDate.delegate = self
        tfPickDate.addDoneButtonOnInputView()
        configureUIDatePicker()
    }
    
    private func configureUIDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.timeZone = TimeZone.current
        datePicker.addTarget(self,
                             action: #selector(handleDatePicker(sender:)),
                             for: .valueChanged)
        tfPickDate.inputView = datePicker
    }
    
    @objc private func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "dd MMM yyyy"
              tfPickDate.text = dateFormatter.string(from: sender.date)
    }
}

// MARK: - TextField Delegate Methods
extension UIDatePickerVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(textField.text ?? "No value in textfield")
    }
}
