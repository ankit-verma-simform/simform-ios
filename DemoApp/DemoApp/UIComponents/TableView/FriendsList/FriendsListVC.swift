//
//  FriendsListVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 25/04/23.
//

import UIKit

class FriendsListVC: UIViewController {
    
    // MARK: - Variables
    private var dictFriends: [Character: [Friend]] = [:]
    
    // MARK: - IB Outlets
    @IBOutlet weak var tblFriends: UITableView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension FriendsListVC {
    private func initialSetup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(gotoAddFriendScreen)
        )
        tblFriends.register(UINib(nibName: "FriendTableViewCell", bundle: nil),
                            forCellReuseIdentifier: "FriendTableViewCell")
        title = "Friends List"
    }
    
    @objc private func gotoAddFriendScreen(sender: Any?) {
        guard let viewController = AddFriendVC
            .create(storyboardName: .tableView) as? AddFriendVC else {
            return
        }
        viewController.delegate = self
        navigate(to: viewController)
    }
    
    private func addFriend(_ friend: Friend) {
        guard let firstChar = friend.firstName?.lowercased().first else {
            return
        }
        var friendsGroup = dictFriends[firstChar] ?? []
        friendsGroup.append(friend)
        dictFriends[firstChar] = friendsGroup
    }
}

// MARK: - Delegate Methods for UITableViewDataSource
extension FriendsListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictFriends.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictFriends[dictFriends.keys.sorted()[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblFriends?.dequeueReusableCell(
            withIdentifier: "FriendTableViewCell", for: indexPath) as? FriendTableViewCell else {
            return UITableViewCell()
        }
        guard let friend = dictFriends[
            dictFriends.keys.sorted()[indexPath.section]]?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.config(friend)
        return cell
    }
}

// MARK: - Delegate Methods for UITableViewDelegate
extension FriendsListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(dictFriends.keys.sorted()[section].uppercased())
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 127
    }
}

// MARK: - Delegate Method for FriendSendable
extension FriendsListVC: FriendDelegate {
    func friend(onFriendAdded friend: Friend) {
        print(friend)
        addFriend(friend)
        tblFriends.reloadData()
    }
}
