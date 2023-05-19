//
//  PlayerTVCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/05/23.
//

import UIKit

// MARK: - Protocols
protocol MessageDelegate: AnyObject {
    func message(to player: Player, playerIndexPath: IndexPath)
}

class PlayerTVCell: UITableViewCell {
    // MARK: - Variables
    static let identifier = "PlayerTVCell"
    private var player: Player?
    private var playerIndexPath = IndexPath()
    weak var delegate: MessageDelegate?
    // MARK: - IB Outlets
    @IBOutlet private weak var lblPlayerName: UILabel!
    @IBOutlet private weak var lblCardsEarned: UILabel!
    @IBOutlet private weak var lblPenalties: UILabel!
    @IBOutlet private weak var imgMessage: UIButton!
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - IB Outlets
extension PlayerTVCell {
    @IBAction private func btnMessageAction(_ sender: UIButton) {
        guard let player else {
            return
        }
        delegate?.message(to: player,
                          playerIndexPath: playerIndexPath)
    }
}

// MARK: - Functions
extension PlayerTVCell {
    func configure(with player: Player,
                   playerIndexPath: IndexPath,
                   messageSent: Bool) {
        lblPlayerName.text = player.name
        lblCardsEarned.text = String(player.cardsEarned)
        lblPenalties.text = String(format: "$%.2f", player.penalties)
        self.player = player
        self.playerIndexPath = playerIndexPath
        if messageSent {
            imgMessage.setImage(Constants.Image.iconCheckMark, for: .normal)
        } else {
            imgMessage.setImage(Constants.Image.iconsMessage, for: .normal)
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
