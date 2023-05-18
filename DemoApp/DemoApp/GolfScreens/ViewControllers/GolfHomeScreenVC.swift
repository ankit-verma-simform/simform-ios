//
//  GolfHomeScreenVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/05/23.
//

import UIKit

class GolfHomeScreenVC: UIViewController {
    // MARK: - Variables
    var golfGame = GolfGame.getGame()
    var messagesSent = [IndexPath: Bool]()
    
    // MARK: - IB Outlets
    @IBOutlet private weak var golfHomeTable: UITableView!
    @IBOutlet weak var customNavbar: UINavigationBar!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension GolfHomeScreenVC {
    private func initialSetup() {
        setupNavBar()
        setupGolfHomeTable()
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = true
        customNavbar.setBackgroundImage(UIImage(), for: .default)
        customNavbar.shadowImage = UIImage()
        customNavbar.isTranslucent = true
    }
    
    private func setupGolfHomeTable() {
        golfHomeTable.delegate = self
        golfHomeTable.dataSource = self
        let golfHomeHeaderView = GolfHomeHeaderView(frame: CGRect(x: 0,
                                                                  y: 0,
                                                                  width: golfHomeTable.frame.size.width,
                                                                  height: 450))
        golfHomeHeaderView.configure(with: golfGame)
        golfHomeTable.tableHeaderView = golfHomeHeaderView
        golfHomeTable.register(UINib(nibName: "PlayerTVCell", bundle: nil), forCellReuseIdentifier: "PlayerTVCell")
        golfHomeTable.register(UINib(nibName: "GroupHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "GroupHeaderView")
    }
    
    private func messagesSentToAllPlayers(ofGroup group: Int) -> Bool {
        var messagesSentToPlayers = 0
        for (idxPath, messageSent) in messagesSent where idxPath.section == group && messageSent {
            messagesSentToPlayers += 1
        }
        return golfGame.groups[group].players.count == messagesSentToPlayers
    }
}

// MARK: - GolfHomeTable DataSource Methods
extension GolfHomeScreenVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return golfGame.groups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return golfGame.groups[section].players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let playerCell = tableView.dequeueReusableCell(withIdentifier: "PlayerTVCell",
                                                             for: indexPath) as? PlayerTVCell else {
            return UITableViewCell()
        }
        playerCell.delegate = self
        playerCell.configure(with: golfGame.groups[indexPath.section].players[indexPath.row],
                             playerIndexPath: indexPath,
                             messageSent: messagesSent[indexPath] ?? false)
        if indexPath.row == golfGame.groups[indexPath.section].players.count - 1 {
            playerCell.layer.masksToBounds = true
            playerCell.layer.cornerRadius = 20
            playerCell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            playerCell.layer.cornerRadius = 0
        }
        return playerCell
    }
}

// MARK: - GolfHomeTable Delegate Methods
extension GolfHomeScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let groupHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "GroupHeaderView") as? GroupHeaderView else {
            return UIView()
        }
        groupHeaderView.delegate = self
        groupHeaderView.containerView.layer.masksToBounds = true
        groupHeaderView.containerView.layer.cornerRadius = 20
        groupHeaderView.containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        groupHeaderView.configure(with: golfGame.groups[section],
                                  isFirstGroup: section == 0,
                                  groupIndex: section,
                                  messageAllSent: messagesSentToAllPlayers(ofGroup: section))
        return groupHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 110
    }
}

// MARK: - Message All Delegate Methods
extension GolfHomeScreenVC: MessageAllDelegate {
    func message(to players: [Player], section: Int) {
        print("Section \(section)")
        for (row, _) in golfGame.groups[section].players.enumerated() {
            let playerIndexPath = IndexPath(row: row,
                                            section: section)
            messagesSent[playerIndexPath] = true
        }
        golfHomeTable.reloadData()
    }
}

// MARK: - Message Delegate Methods
extension GolfHomeScreenVC: MessageDelegate {
    func message(to player: Player, playerIndexPath: IndexPath) {
        print("Player at", playerIndexPath)
        messagesSent[playerIndexPath] = true
        golfHomeTable.reloadData()
    }
}
