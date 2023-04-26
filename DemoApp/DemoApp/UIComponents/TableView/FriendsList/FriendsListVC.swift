//
//  FriendsListVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 25/04/23.
//

import UIKit

class FriendsListVC: UIViewController {
    // MARK: - Variables
    private var sortedKeysDictFriends: [Character] = []
    private var dictFriends: [Character: [Friend]] = [:] {
        didSet {
            sortedKeysDictFriends = dictFriends.keys.sorted()
        }
    }
//     [
//        "a": [
//            Friend(image: UIImage(named: "defaultPerson"), firstName: "Aman", lastName: "Rathod", age: 22),
//            Friend(image: UIImage(named: "defaultPerson"), firstName: "Ankit", lastName: "Verma", age: 22),
//            Friend(image: UIImage(named: "defaultPerson"), firstName: "Ashray", lastName: "Patel", age: 22),
//        ],
//        "p": [
//            Friend(image: UIImage(named: "defaultPerson"), firstName: "Paresh", lastName: "Jain", age: 22),
//            Friend(image: UIImage(named: "defaultPerson"), firstName: "Parth", lastName: "Patel", age: 22),
//        ],
//        "d": [
//            Friend(image: UIImage(named: "defaultPerson"), firstName: "Dev", lastName: "Mehta", age: 22),
//        ]
//    ]
    
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
        setupNavBarItems()
        tblFriends.register(UINib(nibName: "FriendTableViewCell", bundle: nil),
                            forCellReuseIdentifier: "FriendTableViewCell")
        title = "Friends List"
    }
    
    private func setupNavBarItems() {
        let deleteFriends = UIBarButtonItem(
            barButtonSystemItem: .trash,
            target: self,
            action: #selector(deleteFriendsFromList)
        )
        let addFriend = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(gotoAddFriendScreen)
        )
        navigationItem.rightBarButtonItems = [addFriend, deleteFriends]
    }
    
    @objc private func deleteFriendsFromList(sender: Any?) {
        // TODO: complete delete logic, hide/show delete icon on select
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
        guard let firstChar = friend.firstName.lowercased().first else {
            return
        }
        var friendsGroup = dictFriends[firstChar] ?? []
        friendsGroup.append(friend)
        dictFriends[firstChar] = friendsGroup.sorted(by: { $0.firstName < $1.firstName })
    }
}

// MARK: - Delegate Methods for UITableViewDataSource
extension FriendsListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictFriends.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictFriends[sortedKeysDictFriends[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblFriends?.dequeueReusableCell(
            withIdentifier: "FriendTableViewCell", for: indexPath) as? FriendTableViewCell else {
            return UITableViewCell()
        }
        guard let friend = dictFriends[sortedKeysDictFriends[indexPath.section]]?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.config(friend)
        return cell
    }
}

// MARK: - Delegate Methods for UITableViewDelegate
extension FriendsListVC: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {
            return String(sortedKeysDictFriends[section].uppercased())
        }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
            UITableView.automaticDimension
        }
    
    func tableView(
        _ tableView: UITableView,
        estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            UITableView.automaticDimension
        }
}

// MARK: - Delegate Method for FriendDelegate
extension FriendsListVC: FriendDelegate {
    func onFriendAdded(_ friend: Friend) {
        for _ in 1...30 {
            addFriend(friend)
        }
        tblFriends.reloadData()
    }
}
