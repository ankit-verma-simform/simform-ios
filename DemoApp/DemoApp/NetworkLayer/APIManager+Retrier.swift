//
//  APIManager+Retrier.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation
import Alamofire

class APIManagerRetrier: RequestRetrier {

    // MARK: Vars & Lets
    var numberOfRetries = 0

    // MARK: Request Retrier methods
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        if (error.localizedDescription == "The operation couldn’t be completed. Software caused connection abort") {
            completion(true, 1.0) // retry after 1 second
            self.numberOfRetries += 1
        } else if let response = request.task?.response as? HTTPURLResponse, response.statusCode >= 500, self.numberOfRetries < 3 {
            completion(true, 1.0) // retry after 1 second
            self.numberOfRetries += 1
        } else if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401, self.numberOfRetries < 3 {
            completion(false, 0.0)
             // retry after 2 second, mean while token will be updated from backend
        } else {
            completion(false, 0.0) // don't retry
            self.numberOfRetries = 0
        }
    }

}
