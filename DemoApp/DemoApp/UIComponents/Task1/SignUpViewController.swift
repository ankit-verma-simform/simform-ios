//
//  SignUpViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/04/23.
//

import UIKit
import SPIndicator

class SignUpViewController: UIViewController {
    // MARK: Variables
    var validFormDetails = false

    // MARK: IB Outlets
    @IBOutlet private weak var btnPickProfilePhoto: UIButton!
    @IBOutlet private weak var imgProfile: CircularImageView!
    @IBOutlet private weak var tvBio: UITextView!
    @IBOutlet private weak var tfEmail: UITextField!
    @IBOutlet private weak var tfPassword: UITextField!
    @IBOutlet private weak var sliderAge: UISlider!
    @IBOutlet private var lblAgeCollection: [UILabel]!
    @IBOutlet private weak var lblAge: UILabel!
    @IBOutlet private weak var scGender: UISegmentedControl!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeBioTextView()
        setUpAgeSliderLabels()
        setupAllDelegates()
        registerForKeyboardNotifications()
    }
    
    override func viewDidLayoutSubviews() {
        btnPickProfilePhoto.maskCircle()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: IB Actions
extension SignUpViewController {
    @IBAction private func sliderOnAgeChangedAction(_ sender: UISlider) {
        lblAge.text = String(Int(sender.value))
    }
    
    @IBAction private func btnOnSignUpAction(_ sender: UIButton) {
        validateAllFormDetails()
        if validFormDetails
            && tvBio.text.isNotEmpty {
            SPIndicator.present(
                title: "Success",
                message: "Sign Up successful!",
                preset: .done)
        }
        else {
            SPIndicator.present(
                title: "Invalid Entries",
                message: "Fill all details correctly!",
                preset: .error)
        }
    }
    
    @IBAction private func btnPickPhotoAction(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true)
    }
}

// MARK: Functions
extension SignUpViewController {
    private func customizeBioTextView() {
        tvBio.backgroundColor = .white
        tvBio.layer.borderWidth = 1
        tvBio.layer.cornerRadius = 4
        tvBio.layer.borderColor = UIColor.systemGray5.cgColor
        tvBio.addDoneButtonOnKeyboard()
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
    
    private func setupAllDelegates() {
        tfEmail.delegate = self
        tfPassword.delegate = self
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardAppear(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardDisappear(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc private func onKeyboardAppear(_ notification: NSNotification) {
        guard let info = notification.userInfo,
              let rect: CGRect = info[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect
        else { return }
        let kbSize = rect.size
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }
    
    @objc private func onKeyboardDisappear(_ notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
}

// MARK: Delegate Methods for UITextField
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // link keyboard return to next textfields
        switch textField {
        case tfEmail: tfPassword.becomeFirstResponder()
        case tfPassword: tvBio.becomeFirstResponder()
        default:
            return false
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let inputText = textField.text,
              inputText.isNotEmpty else {
            return
        }
        // change text color based on input validation
        switch textField {
        case tfEmail:
            if !inputText.isValidEmail {
                validFormDetails = false
                tfEmail.textColor = .systemRed
            } else {
                tfEmail.textColor = .black
            }
        case tfPassword:
            if !inputText.isValidPassword {
                validFormDetails = false
                tfPassword.textColor = .systemRed
            } else {
                tfPassword.textColor = .black
            }
        default:
            break
        }
    }
    
    private func validateAllFormDetails() {
        guard let email = tfEmail.text,
              email.isValidEmail,
              let password = tfPassword.text,
              password.isValidPassword else {
            return
        }
        validFormDetails = true
    }
}

// MARK: Delegate Methods for UIImagePicker
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        imgProfile.image = image
        picker.dismiss(animated: true)
    }
}
