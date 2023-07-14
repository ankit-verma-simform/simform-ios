//
//  WebServicesVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 27/06/23.
//

import UIKit
import Alamofire
import RswiftResources
import SPIndicator

class WebServicesVC: UIViewController {
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print(AppConstant.serverURL)
    }
}

// MARK: - IB Actions
extension WebServicesVC {
    @IBAction private func btnGetProductListClicked(_ sender: UIButton) {
        getProductListFromWebService()
    }
    
    @IBAction private func btnRegisterUserClicked(_ sender: UIButton) {
        registerUser()
    }
    
    @IBAction private func btnGetProductListUsingAlamofireClicked(_ sender: UIButton) {
        getProductDataUsingAlamofire()
    }
    
    @IBAction private func btnRegisterUserUsingAlamofireClicked(_ sender: UIButton) {
        registerUserUsingAlamofire()
    }
    
    @IBAction private func btnProductListingClicked(_ sender: UIButton) {
        guard let vc = ProductListingVC.create(storyboardName: .webServices) else {
            return
        }
        navigate(to: vc, animated: true)
    }
    
    @IBAction private func btnRSSFeedClicked(_ sender: UIButton) {
        guard let vc = RSSFeedVC.create(storyboardName: .webServices) else {
            return
        }
        navigate(to: vc, animated: true)
    }
    
    @IBAction private func btnExploreUsersClicked(_ sender: UIButton) {
        guard let vc = ExploreLoginVC.create(storyboardName: .webServices) else {
            return
        }
        navigate(to: vc, animated: true)
    }
}

// MARK: - Functions
extension WebServicesVC {
    private func registerUserUsingAlamofire() {
        APIManager.shared.call(type: .registerUser, params: ["email": "eve.holt@reqres.in", "password": "pistol"]) {
            (result: Swift.Result<RegisterResponse, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("Error occured: \(error.localizedDescription)")
                    SPIndicator.present(
                        title: "Failed Registration",
                        message: "\(error.body)",
                        preset: .error)
                case .success(let registerResponse):
                    if let error = registerResponse.error {
                        print("Error: \(error)")
                        return
                    }
                    print(registerResponse)
                    SPIndicator.present(
                        title: "Registered User",
                        message: "Token: \(registerResponse.token ?? "")",
                        preset: .done)
                }
            }
        }
        
//        For reference only
//
//        AF.request(url,
//                   method: .post,
//                   parameters: ["email": "eve.holt@reqres.in", "password": "pistol"],
//                   encoding: JSONEncoding.default)
//        .response { response in
//            switch response.result {
//            case .failure(let error):
//                print("Network Error: \(error)")
//                return
//            case .success(let data):
//                do {
//                    guard let data else {
//                        return
//                    }
//                    let registerResponse = try JSONDecoder().decode(RegisterResponse.self, from: data)
//                    print(registerResponse)
//                } catch let error {
//                    print("Json Serialization Error: \(error)")
//                }
//            }
//        }
    }
    
    private func getProductDataUsingAlamofire() {
        APIManager.shared.call(type: .getProductList(noOfProducts: 10, skip: 0), params: nil) {
            (result: Swift.Result<ProductList, CustomError>) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("Error occured: \(error.localizedDescription)")
                    SPIndicator.present(
                        title: "Error",
                        message: "\(error.body)",
                        preset: .error)
                case .success(let productList):
                    print(productList)
                    SPIndicator.present(
                        title: "Products Retrieved",
                        message: String(productList.products.count),
                        preset: .done)
                }
            }
        }

//        For reference only
//
//        AF.request(url).response { response in
//            switch response.result {
//            case .success(let data):
//                do {
//                    guard let data else {
//                        return
//                    }
//                    let productList = try JSONDecoder().decode(ProductList.self, from: data)
//                    print(productList)
//                } catch let error {
//                    print("Json Serialization Error: \(error)")
//                }
//
//            case .failure(let error):
//                print("Network Error: \(error)")
//            }
//        }
    }
    
    private func getProductListFromWebService() {
        guard let url = URL(string: "https://dummyjson.com/products?limit=1000") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { (data, urlRequest, error) in
            if let error {
                print("Response error: \(error)")
                return
            }
            if let urlRequest {
                print("Url Request: \(urlRequest)")
            }
            guard let data else {
                return
            }
            print("Data: \(data)")
            
            // JSON Serialization
            guard let jsonData = try? JSONSerialization.jsonObject(with: data) else {
                print("Json Serialization error: \(String(describing: error))")
                DispatchQueue.main.async {
                    SPIndicator.present(
                        title: "Error",
                        message: "\(error?.localizedDescription ?? "")",
                        preset: .error)
                }
                return
            }
            print(jsonData)
            DispatchQueue.main.async {
                SPIndicator.present(
                    title: "Products Retrieved",
                    message: "\(jsonData)",
                    preset: .done)
            }
        })
        task.resume()
    }
    
    private func registerUser() {
        guard let url = URL(string: "https://reqres.in/api/register") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        // configuring URL Request Headers
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // encoding data
        // let user = User(email: "ankit@gmail.com", password: "@nkit123") // not a valid user
        let user = User(email: "eve.holt@reqres.in", password: "pistol") // a valid user
        guard let data = try? JSONEncoder().encode(user) else {
            print("Encoding error")
            return
        }
        
        urlRequest.httpBody = data
        let task = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            if let error {
                print("Network Error: \(error)")
                DispatchQueue.main.async {
                    SPIndicator.present(
                        title: "Error",
                        message: "\(error.localizedDescription)",
                        preset: .error)
                }
                return
            }
            guard let data else {
                return
            }
            
            // decoding data
            do {
                let registerResponse = try JSONDecoder().decode(RegisterResponse.self, from: data)
                print(registerResponse)
                DispatchQueue.main.async {
                    SPIndicator.present(
                        title: "Registered Successfully",
                        message: "Token: \(registerResponse.token ?? "")",
                        preset: .done)
                }
            }
            catch let error {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    SPIndicator.present(
                        title: "Error",
                        message: "\(error.localizedDescription)",
                        preset: .error)
                }
            }
        }
        task.resume()
    }
}
