//
//  APIManager+Request.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire

struct UploadFileRequest {
    var fileData: Data
    var fileName: String
    var mimeType: String
    var paramName: String
}

/// Mime Type
enum MimeType: String {
    case jpegImage = "jpeg"
    case pngImage = "png"
    case jpgImage = "jpg"
    case pdf = "pdf"
    case applicationJSON = "json"
    
    func getMimeType() -> String {
        switch self {
        case .jpegImage: return "image/jpeg"
        case .pngImage: return "image/png"
        case .jpgImage: return "image/jpg"
        case .pdf: return "application/pdf"
        case .applicationJSON: return "application/json"
        }
    }
}

// MARK: Enums
enum RequestItemsType: Equatable {
    case getProductList(noOfProducts: Int, skip: Int)
    case refreshToken
    case registerUser
    case exploreUserLogin
    case exploreUserSignup
    case getExploreUsers
}

// MARK: Extensions
// MARK: EndPointType
extension RequestItemsType: EndPointType {

    // MARK: Vars & Lets
    var baseURL: String {
        switch self {
        case .getProductList:
            return "https://dummyjson.com"
        case .registerUser:
            return "https://reqres.in/api"
        case .exploreUserLogin, .exploreUserSignup, .getExploreUsers:
            return "https://dummyjson.com"
        default:
            return AppConstant.serverURL
        }
    }
    
    var version: String {
        switch self {
        case .getProductList, .registerUser, .exploreUserLogin, .exploreUserSignup, .getExploreUsers:
            return ""
        default:
            return "/v1"
        }
    }
    
    var path: String {
        switch self {
        case .getProductList(let noOfProducts, let skip):
            return "/products?limit=\(noOfProducts)&skip=\(skip)"
        case .registerUser:
            return "/register"
        case .refreshToken:
            return "/"
        case .exploreUserLogin:
            return "/auth/login"
        case .exploreUserSignup:
            return "/users/add"
        case .getExploreUsers:
            return "/users"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getProductList, .refreshToken, .getExploreUsers:
            return .get
        case .registerUser, .exploreUserLogin, .exploreUserSignup:
            return .post
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getProductList, .refreshToken, .registerUser, .exploreUserLogin, .exploreUserSignup, .getExploreUsers:
            return nil
        }
    }
    
    var url: URL {
        return URL(string: self.baseURL + self.version + self.path.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
}
