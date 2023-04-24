//
//  LoginViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/04/23.
//

import UIKit
import SPIndicator

class LoginViewController: UIViewController {
    // MARK: - Variables
    private var validFormDetails = false
    
    // MARK: - IB Outlets
    @IBOutlet private weak var tfEmail: UITextField!
    @IBOutlet private var tfPassword: UITextField!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllDelegates()
        registerForKeyboardNotifications()
    }

    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
}

// MARK: - Functions
extension LoginViewController {
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
        guard let keyboardFrame = notification
            .userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        scrollView.contentInset.bottom = view.convert(
            keyboardFrame.cgRectValue, from: nil).size.height
    }
    
    @objc private func onKeyboardDisappear(_ notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
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

// MARK: - IB Actions
extension LoginViewController {
    @IBAction func btnOnLogInAction(_ sender: UIButton) {
        validateAllFormDetails()
        if validFormDetails {
            SPIndicator.present(
                title: "Success",
                message: "Log In successful!",
                preset: .done)
        }
        else {
            SPIndicator.present(
                title: "Invalid Entries",
                message: "Fill all details correctly!",
                preset: .error)
        }
    }
}

// MARK: - Delegate Methods for UITextField
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // link keyboard return to next textfields
        switch textField {
        case tfEmail: tfPassword.becomeFirstResponder()
        case tfPassword: tfPassword.resignFirstResponder()
        default: return false
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
}
