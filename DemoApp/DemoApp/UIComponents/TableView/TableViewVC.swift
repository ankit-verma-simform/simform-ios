//
//  TableViewVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 24/04/23.
//

import UIKit

class TableViewVC: UIViewController {
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IB Actions
extension TableViewVC {
    @IBAction private func navigateToSessionPractice(_ sender: UIButton) {
        guard let viewController = TableContentVC
            .create(storyboardName: .tableView) as? TableContentVC else {
            return
        }
        navigate(to: viewController)
    }
    
    @IBAction private func navigateToFriendsList(_ sender: UIButton) {
        guard let viewController = FriendsListVC
            .create(storyboardName: .tableView) as? FriendsListVC else {
            return
        }
        navigate(to: viewController)
    }
}
