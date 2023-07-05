//
//  ExploreSignUpVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/07/23.
//

import UIKit
import SPIndicator

class ExploreSignUpVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var tfUsername: UITextField!
    @IBOutlet private weak var tfFirstName: UITextField!
    @IBOutlet private weak var tfLastName: UITextField!
    @IBOutlet private weak var tfPassword: UITextField!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IB Actions
extension ExploreSignUpVC {
    @IBAction private func btnLoginClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func btnSignUpClicked(_ sender: Any) {
        guard let username = tfUsername.text,
              let password = tfPassword.text,
              let firstName = tfFirstName.text,
              let lastName = tfLastName.text else {
            return
        }
        
        guard username.isNotEmpty, password.isNotEmpty, firstName.isNotEmpty, lastName.isNotEmpty else {
            SPIndicator.present(title: "Signup Failed", message: "Fields can't be empty", preset: .error)
            return
        }
        APIManager.shared.call(type: .exploreUserSignup,
                               params: [
                                "username": username,
                                "password": password,
                                "firstName": firstName,
                                "lastName": lastName
                               ]) { [weak self] (result: Swift.Result<ExploreSignupUserResponse, CustomError>) in
                                   guard let self else {
                                       return
                                   }
                                   
                                   switch result {
                                   case .failure(let error):
                                       SPIndicator.present(title: "Signup Failed", message: error.body, preset: .error)
                                   case .success(let responseUser):
                                       SPIndicator.present(title: "Signup Successful", preset: .done)
                                       print(responseUser)
                                       guard let vc = ExploreUsersVC.create(storyboardName: .webServices) else {
                                           return
                                       }
                                       self.navigate(to: vc, animated: true)
                                   }
                               }
    }
}
