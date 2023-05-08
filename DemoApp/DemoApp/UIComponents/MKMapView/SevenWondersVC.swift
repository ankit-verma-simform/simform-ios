//
//  SevenWondersVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 08/05/23.
//

import UIKit

class SevenWondersVC: UIViewController {
    // MARK: - Variables
    private let sevenWondersList = [
        "Great Wall of China",
        "Chichén Itzá",
        "Petra",
        "Machu Picchu",
        "Christ the Redeemer",
        "Colosseum",
        "Taj Mahal"
    ]
    
    // MARK: - IB Outlets
    @IBOutlet private weak var picker: UIPickerView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension SevenWondersVC {
    private func initialSetup() {
        picker.delegate = self
    }
}

// MARK: - UIPicker DataSource Methods
extension SevenWondersVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        sevenWondersList.count
    }
}

// MARK: - UIPicker Delegate Methods
extension SevenWondersVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return sevenWondersList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        print(row)
    }
}
