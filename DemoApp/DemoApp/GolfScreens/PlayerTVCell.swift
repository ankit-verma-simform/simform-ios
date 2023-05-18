//
//  PlayerTVCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/05/23.
//

import UIKit

protocol MessageDelegate: AnyObject {
    func message(to player: Player, playerIndexPath: IndexPath)
}

class PlayerTVCell: UITableViewCell {
    // MARK: - Variables
    private var player: Player?
    private var playerIndexPath = IndexPath()
    weak var delegate: MessageDelegate?

    // MARK: - IB Outlets
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblCardsEarned: UILabel!
    @IBOutlet weak var lblPenalties: UILabel!
    @IBOutlet weak var imgMessage: UIButton!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - IB Outlets
extension PlayerTVCell {
    @IBAction func btnMessageAction(_ sender: UIButton) {
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
            imgMessage.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            imgMessage.setImage(Constants.Image.iconsMessage, for: .normal)
        }
    }
}
