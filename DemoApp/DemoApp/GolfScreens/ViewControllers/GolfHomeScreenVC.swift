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
    //private var messagesSent = [Int: Set<IndexPath>]()
    
    // MARK: - IB Outlets
    @IBOutlet private weak var golfHomeTable: UITableView!
    @IBOutlet private weak var customNavbar: UINavigationBar!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addDynamicHeightForTableHeader()
    }
}

// MARK: - Functions
extension GolfHomeScreenVC {
    private func initialSetup() {
        setupNavBar()
        setupGolfHomeTable()
    }
    
    private func setupNavBar() {
        navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let label = UILabel()
        label.text = "Home"
        label.textColor = .white
        navigationItem.titleView = label
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Constants.Image.threeDots,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(btnMenuClicked))
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc private func btnMenuClicked() {
        guard let viewController = AdjustableTextViewDemoVC.create(storyboardName: .golfScreens) as? AdjustableTextViewDemoVC else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupGolfHomeTable() {
        golfHomeTable.delegate = self
        golfHomeTable.dataSource = self
        let golfHomeHeaderView = GolfHomeHeaderView()
        golfHomeHeaderView.configure(with: golfGame)
        golfHomeTable.tableHeaderView = golfHomeHeaderView
        golfHomeTable.register(PlayerTVCell.nib(),
                               forCellReuseIdentifier: PlayerTVCell.identifier)
        golfHomeTable.register(GroupHeaderView.nib(),
                               forHeaderFooterViewReuseIdentifier: GroupHeaderView.identifier)
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
    
    private func addDynamicHeightForTableHeader() {
        guard let tableHeaderView = golfHomeTable.tableHeaderView as? GolfHomeHeaderView else {
            return
        }
        let width = golfHomeTable.bounds.size.width
        let size = tableHeaderView.systemLayoutSizeFitting(CGSize(width: width,
                                                                  height: UIView.layoutFittingCompressedSize.height))
        if tableHeaderView.frame.size.height != size.height {
            tableHeaderView.frame.size.height = size.height
            golfHomeTable.tableHeaderView = tableHeaderView
        }
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
                             messageSent: golfGame.groups[indexPath.section].players[indexPath.row].isMessageSent)
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
                                  messageAllSent: golfGame.groups[section].isMessageSentToAllPlayers)
        return groupHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - Message All Delegate Methods
extension GolfHomeScreenVC: MessageAllDelegate {
    func message(to players: [Player], section: Int) {
        print("Section \(section)")
        for playerIndex in golfGame.groups[section].players.indices {
            golfGame.groups[section].players[playerIndex].isMessageSent = true
        }
        golfHomeTable.reloadSections(IndexSet(integer: section), with: .none)
    }
}

// MARK: - Message Delegate Methods
extension GolfHomeScreenVC: MessageDelegate {
    func message(to player: Player, playerIndexPath: IndexPath) {
        print("Player at", playerIndexPath)
        golfGame.groups[playerIndexPath.section].players[playerIndexPath.row].isMessageSent = true
        if golfGame.groups[playerIndexPath.section].isMessageSentToAllPlayers {
            golfHomeTable.reloadSections(IndexSet(integer: playerIndexPath.section), with: .none)
        }
        else {
            golfHomeTable.reloadRows(at: [playerIndexPath], with: .none)
        }
    }
}
