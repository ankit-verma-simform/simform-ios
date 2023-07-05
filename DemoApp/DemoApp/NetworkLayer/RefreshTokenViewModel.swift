//
//  RefreshTokenViewModel.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class RefreshTokenViewModel {

    var isSuccess: Dynamic<Bool> = Dynamic(true)

    func callRefreshToken() {
        let params: [String: Any] = [APIParams.Authentication.refreshToken: ""]
        APIManager.shared.call(type: .refreshToken, params: params) { [weak self] (result: Swift.Result<SessionModel, CustomError>) in
            guard let uSelf = self else {
                return
            }
            switch result {
            case .success:
                // TODO: save token.
                uSelf.isSuccess.value = true
            case .failure(let error):
                print(error.body)
                uSelf.isSuccess.value = false
            }
        }
    }
}
