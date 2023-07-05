//
//  APIManager+FakeDataProvider.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire
import UIKit
import Reachability

/// Provide fake data to controller
class FakeDataProvider: NetworkManger {

    func call<T>(type: RequestItemsType, params: Parameters?, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable {
        handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noData)))
    }
    
}
