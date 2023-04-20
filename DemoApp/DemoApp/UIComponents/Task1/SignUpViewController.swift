//
//  SignUpViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/04/23.
//

import UIKit

class SignUpViewController: UIViewController {
     
    // MARK: IB Outlets
    @IBOutlet weak var btnPickProfilePhoto: UIButton!
    @IBOutlet weak var imgProfile: CircularImageView!
    @IBOutlet weak var tvBio: UITextView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var sliderAge: UISlider!
    @IBOutlet var lblAgeCollection: [UILabel]!
    @IBOutlet weak var lblAge: UILabel!
    
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeBioTextView()
        setUpAgeSliderLabels()
    }
    
    override func viewDidLayoutSubviews() {
        btnPickProfilePhoto.maskCircle()
    }

}

// MARK: Functions
extension SignUpViewController {
    func customizeBioTextView() {
        tvBio.backgroundColor = .white
        tvBio.layer.borderWidth = 1
        tvBio.layer.cornerRadius = 4
        tvBio.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    private func setUpAgeSliderLabels() {
        lblAge.text = String(Int(sliderAge.value))
        for label in lblAgeCollection {
            switch label.tag {
            case 1: label.text = String(Int(sliderAge.minimumValue))
            case 2: label.text = String(Int(sliderAge.maximumValue))
            default: continue
            }
        }
    }
}


// MARK: IB Actions
extension SignUpViewController {
    @IBAction func sliderOnAgeChangedAction(_ sender: UISlider) {
        lblAge.text = String(Int(sender.value))
    }
}

