//
//  ExploreLoginVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/07/23.
//

import UIKit
import SPIndicator

class ExploreLoginVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var tfPassword: UITextField!
    @IBOutlet private weak var tfUsername: UITextField!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IB Actions
extension ExploreLoginVC {
    @IBAction func btnLoginClicked(_ sender: Any) {
        guard let username = tfUsername.text,
              let password = tfPassword.text else {
            return
        }
        guard username.isNotEmpty,
              password.isNotEmpty else {
            SPIndicator.present(title: "Login Failed",
                                message: "Fields can't be empty!",
                                preset: .error)
            return
        }
        APIManager.shared.call(type: .exploreUserLogin,
                               params: ["username": username, "password": password]) { [weak self]
            (result: Swift.Result<ExploreLoginUserResponse, CustomError>) in
            
            switch result {
            case .success(let user):
                print(user)
                SPIndicator.present(title: "Login Successful", preset: .done)
                
                guard let vc = ExploreUsersVC.create(storyboardName: .webServices) else {
                    return
                }
                self?.navigate(to: vc, animated: true)
                
            case .failure(let error):
                print("Failed! \(error.body)")
                SPIndicator.present(title: "Login Failed", message: error.body, preset: .error)
            }
        }
    }
    
    @IBAction func btnSignUpClicked(_ sender: Any) {
        guard let vc = ExploreSignUpVC.create(storyboardName: .webServices) else {
            return
        }
        navigate(to: vc, animated: true)
    }
}
