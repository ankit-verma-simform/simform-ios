//
//  APIManager+Adapter.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import UIKit
import Alamofire

class APIManagerAdapter: RequestAdapter {
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        return urlRequest
    }
}
