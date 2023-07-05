//
//  Explore.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/07/23.
//

import Foundation

struct ExploreLoginUser: Codable {
    let username, password: String
}

struct ExploreLoginUserResponse: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
}

struct ExploreSignupUserResponse: Codable {
    let id: Int
    let username, firstName, lastName: String
    let password: String?
}

struct ExploreUsers: Codable {
    let users: [ExploreUser]
    let total, skip, limit: Int
}

struct ExploreUser: Codable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let gender, email, phone, username: String
    let password, birthDate: String
    let image: String
}
