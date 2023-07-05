//
//  SessionModel.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class SessionModel: Codable {
    var accessToken: String?
    var tokenType: String?
    var expiresIn: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case tokenType = "tokenType"
        case expiresIn = "expiresIn"
    }
}
