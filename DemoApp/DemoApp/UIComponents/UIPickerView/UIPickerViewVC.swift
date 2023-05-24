//
//  UIPickerViewVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 05/05/23.
//

import UIKit
import SPIndicator

class UIPickerViewVC: UIViewController {
    // MARK: - Variables
    private var lockerValues = [
        Array(0...9),
        Array(0...9),
        Array(0...9),
        Array(0...9),
        Array(0...9),
    ]
    private let password = [9, 4, 2, 0, 5]
    private var guessedPassword = [0, 0, 0, 0, 0]
    
    // MARK: - IB Outlets
    @IBOutlet private weak var imgLocker: UIImageView!
    @IBOutlet private weak var picker: UIPickerView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension UIPickerViewVC {
    private func initialSetup() {
        picker.delegate = self
        picker.dataSource = self
    }
    
    private func tryUnlockingVault() {
        if zip(password, guessedPassword).allSatisfy({ $0.0 == $0.1 }) {
            SPIndicatorView(title: "Success", message: nil, preset: .done).present()
            imgLocker.image = UIImage(named: "lockerOpened")
        }
    }
}

// MARK: - UIPickerView DataSource Methods
extension UIPickerViewVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return lockerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lockerValues.first?.count ?? 0
    }
}

// MARK: - UIPickerView Delegate Methods
extension UIPickerViewVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(lockerValues[component][row])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(component, row)
        guessedPassword[component] = row
        tryUnlockingVault()
    }
}
