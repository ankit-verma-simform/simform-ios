//
//  User.swift
//  DemoApp
//
//  Created by Ankit Verma on 27/06/23.
//

struct User: Codable {
    let email: String?
    let password: String?
}
// SAMPLE:
// {
//     "email": "eve.holt@reqres.in",
//     "password": "pistol"
// }

struct RegisterResponse: Codable {
    let id: Int?
    let token: String?
    let error: String?
}
// SAMPLE:
// {
//     "id": 4,
//     "token": "QpwL5tke4Pnpja7X4"
// }
