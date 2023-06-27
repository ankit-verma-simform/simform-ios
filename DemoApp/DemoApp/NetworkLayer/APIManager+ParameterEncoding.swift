//
//  APIManager+ParameterEncoding.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire

extension String: ParameterEncoding {
    
    // MARK: Public Methods
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}
