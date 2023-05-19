//
//  GolfHomeScreenVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/05/23.
//

import UIKit
import UIViewBordersSwift

class GolfHomeScreenVC: UIViewController {
    // MARK: - Variables
    private var golfGame = GolfGame.getGame()
    private var messagesSent = [Int: Set<IndexPath>]()
    
    // MARK: - IB Outlets
    @IBOutlet private weak var golfHomeTable: UITableView!
    @IBOutlet private weak var customNavbar: UINavigationBar!
    
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
        let headerHeight: CGFloat = golfGame.cards.isEmpty ? 435 : 474
        let golfHomeHeaderView = GolfHomeHeaderView(frame: CGRect(x: 0,
                                                                  y: 0,
                                                                  width: golfHomeTable.frame.size.width,
                                                                  height: headerHeight))
        golfHomeHeaderView.configure(with: golfGame)
        golfHomeTable.tableHeaderView = golfHomeHeaderView
        golfHomeTable.register(PlayerTVCell.nib(),
                               forCellReuseIdentifier: PlayerTVCell.identifier)
        golfHomeTable.register(GroupHeaderView.nib(),
                               forHeaderFooterViewReuseIdentifier: GroupHeaderView.identifier)
    }
    
    private func messagesSentToAllPlayers(ofGroup group: Int) -> Bool {
        return (messagesSent[group]?.count ?? 0) == golfGame.groups[group].players.count
    }
    
    private func addBordersAndCornersToPlayerRow(withView playerCell: PlayerTVCell, isLastPlayerRow: Bool) {
        playerCell.layer.sublayers?.removeAll(where: { caLayer in
            return caLayer.name == "borderLayer" || caLayer.name == "cornerShapeLayer"
        })
        if isLastPlayerRow {
            playerCell.roundCorners(cornerRadius: 20, bottom: true)
            playerCell.layoutIfNeeded()
            playerCell.layer.addBorder(side: .bottom,
                                       thickness: 1,
                                       color: Constants.Color.lightWhite,
                                       maskedCorners: CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner))
        } else {
            playerCell.resetCorners()
        }
        playerCell.layer.addBorder(side: .left, thickness: 1, color: Constants.Color.lightWhite)
        playerCell.layer.addBorder(side: .right, thickness: 1, color: Constants.Color.lightWhite)
        playerCell.clipsToBounds = true
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
        guard let playerCell = tableView.dequeueReusableCell(withIdentifier: PlayerTVCell.identifier,
                                                             for: indexPath) as? PlayerTVCell else {
            return UITableViewCell()
        }
        playerCell.delegate = self
        playerCell.configure(with: golfGame.groups[indexPath.section].players[indexPath.row],
                             playerIndexPath: indexPath,
                             messageSent: messagesSent[indexPath.section]?.contains(indexPath) ?? false)
        let isLastPlayerRow = indexPath.row == golfGame.groups[indexPath.section].players.count - 1
        addBordersAndCornersToPlayerRow(withView: playerCell, isLastPlayerRow: isLastPlayerRow)
        return playerCell
    }
}

// MARK: - GolfHomeTable Delegate Methods
extension GolfHomeScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let groupHeaderView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: GroupHeaderView.identifier) as? GroupHeaderView else {
            return UIView()
        }
        groupHeaderView.delegate = self
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
        messagesSent[section] = messagesSent[section] ?? []
        for (row, _) in golfGame.groups[section].players.enumerated() {
            let playerIndexPath = IndexPath(row: row,
                                            section: section)
            messagesSent[playerIndexPath.section]?.insert(playerIndexPath)
        }
        golfHomeTable.reloadSections(IndexSet(integer: section), with: .none)
    }
}

// MARK: - Message Delegate Methods
extension GolfHomeScreenVC: MessageDelegate {
    func message(to player: Player, playerIndexPath: IndexPath) {
        print("Player at", playerIndexPath)
        messagesSent[playerIndexPath.section] = messagesSent[playerIndexPath.section] ?? []
        messagesSent[playerIndexPath.section]?.insert(playerIndexPath)
        if messagesSentToAllPlayers(ofGroup: playerIndexPath.section) {
            golfHomeTable.reloadSections(IndexSet(integer: playerIndexPath.section), with: .none)
        } else {
            golfHomeTable.reloadRows(at: [playerIndexPath], with: .none)
        }
    }
}
