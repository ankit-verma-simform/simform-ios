//
//  ExploreUsersViewModel.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/07/23.
//

import Foundation

class ExploreUsersViewModel {
    private (set) var users = Dynamic([ExploreUser]())
    
    init() {
        loadUsersFromAPI()
    }
    
    private func loadUsersFromAPI() {
        APIManager.shared.call(type: .getExploreUsers, params: nil) {
            [weak self] (result: Swift.Result<ExploreUsers, CustomError>) in
            switch result {
            case .failure(let error):
                print(error.body)
            case .success(let userList):
                print(userList.users.first ?? "")
                self?.users.value = userList.users
            }
        }
    }
}
