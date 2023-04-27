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
            if dictFriends.keys.count != oldValue.keys.count {
                sortedKeysDictFriends = dictFriends.keys.sorted()
            }
        }
    }
    private var dummyFriends: [Character: [Friend]] = [
        "a": [
            Friend(image: UIImage(named: "defaultPerson"), firstName: "Aman", lastName: "Rathod", age: 22),
            Friend(image: UIImage(named: "defaultPerson"), firstName: "Ankit", lastName: "Verma", age: 22),
            Friend(image: UIImage(named: "defaultPerson"), firstName: "Ashray", lastName: "Patel", age: 22),
        ],
        "p": [
            Friend(image: UIImage(named: "defaultPerson"), firstName: "Paresh", lastName: "Jain", age: 22),
            Friend(image: UIImage(named: "defaultPerson"), firstName: "Parth", lastName: "Patel", age: 22),
        ],
        "d": [
            Friend(image: UIImage(named: "defaultPerson"), firstName: "Dev", lastName: "Mehta", age: 22),
        ]
    ]
    var deleteFriends: UIBarButtonItem = UIBarButtonItem()
    
    // MARK: - IB Outlets
    @IBOutlet weak var tblFriends: UITableView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
        initialSetup()
        dictFriends = dummyFriends
    }
}

// MARK: - Functions
extension FriendsListVC {
    private func initialSetup() {
        setupNavBarItems()
        tblFriends.register(UINib(nibName: "FriendTableViewCell", bundle: nil),
                            forCellReuseIdentifier: "FriendTableViewCell")
        tblFriends.contentInsetAdjustmentBehavior = .never
        title = "Friends List"
    }
    
    private func setupNavBarItems() {
        deleteFriends = UIBarButtonItem(
            barButtonSystemItem: .trash,
            target: self,
            action: #selector(deleteFriendsFromList)
        )
        let addFriend = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(gotoAddFriendScreen)
        )
        deleteFriends.isHidden = true
        navigationItem.rightBarButtonItems = [addFriend, deleteFriends]
    }
    
    @objc private func deleteFriendsFromList(sender: Any?) {
        dictFriends.forEach { (section, friends) in
            var indexPaths: [IndexPath] = []
            var remainingFriends: [Friend] = []
            for (index, friend) in friends.enumerated() {
                if friend.isSelected {
                    indexPaths.append(
                        IndexPath(row: index,
                                  section: sortedKeysDictFriends.firstIndex(of: section) ?? 0))
                }
                else {
                    remainingFriends.append(friend)
                }
            }
            dictFriends[section] = remainingFriends.isEmpty ? nil : remainingFriends
            guard let _ = dictFriends[section] else {
                sortedKeysDictFriends = dictFriends.keys.sorted()
                tblFriends.reloadData()
                return
            }
            tblFriends.deleteRows(at: indexPaths, with: .none)
        }
        deleteFriends.isHidden = true
    }
    
    @objc private func gotoAddFriendScreen(sender: Any?) {
        deSelectAllFriends()
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
    
    private func deSelectAllFriends() {
        tblFriends.indexPathsForSelectedRows?.forEach({ indexPath in
            dictFriends[sortedKeysDictFriends[indexPath.section]]?[indexPath.row].isSelected = false
            tblFriends.reloadRows(at: [indexPath], with: .none)
        })
        deleteFriends.isHidden = true
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
        guard let friend = dictFriends[sortedKeysDictFriends[indexPath.section]]?[indexPath.row] else {
            return UITableViewCell()
        }
        guard let cell = tblFriends?.dequeueReusableCell(
            withIdentifier: "FriendTableViewCell", for: indexPath) as? FriendTableViewCell else {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentState = dictFriends[sortedKeysDictFriends[indexPath.section]]?[indexPath.row].isSelected else {
            return
        }
        tableView.setEditing(true, animated: true)
        dictFriends[sortedKeysDictFriends[indexPath.section]]?[indexPath.row].isSelected = !currentState
        tableView.reloadRows(at: [indexPath], with: .fade)
        tableView.setEditing(false, animated: true)
        deleteFriends.isHidden = false
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        dictFriends[sortedKeysDictFriends[indexPath.section]]?[indexPath.row].isSelected = false
//        tableView.reloadRows(at: [indexPath], with: .fade)
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = SectionHeader(frame: CGRect(x: 0, y: 0, width: tblFriends.frame.width, height: 50))
//        header.lblTitle.text = String(sortedKeysDictFriends[section].uppercased())
//        return header
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
}

// MARK: - Delegate Method for FriendDelegate
extension FriendsListVC: FriendDelegate {
    func onFriendAdded(_ friend: Friend) {
//        for _ in 1...30 {
            addFriend(friend)
//        }
        tblFriends.reloadData()
    }
}
