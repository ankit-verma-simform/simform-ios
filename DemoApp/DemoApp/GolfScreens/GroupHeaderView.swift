//
//  GroupHeaderView.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/05/23.
//

import UIKit

protocol MessageAllDelegate: AnyObject {
    func message(to players: [Player], section: Int)
}

class GroupHeaderView: UITableViewHeaderFooterView {
    // MARK: - Variables
    weak var delegate: MessageAllDelegate?
    private var group: Group?
    private var groupIndex = Int()

    // MARK: - IB Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblGroupName: UILabel!
    @IBOutlet weak var scoreStackView: UIStackView!
    @IBOutlet weak var imgMessage: UIButton!
    
    // MARK: - Properties
    override var reuseIdentifier: String? {
        return "GroupHeaderView"
    }
}

// MARK: - IB Actions
extension GroupHeaderView {
    @IBAction func btnMessageAllAction(_ sender: UIButton) {
        delegate?.message(to: group?.players ?? [], section: groupIndex)
    }
}

// MARK: - Functions
extension GroupHeaderView {
    func configure(with group: Group,
                   isFirstGroup: Bool,
                   groupIndex: Int,
                   messageAllSent: Bool) {
        lblGroupName.text = group.name
        scoreStackView.isHidden = !isFirstGroup
        self.group = group
        self.groupIndex = groupIndex
        if messageAllSent {
            imgMessage.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            imgMessage.setImage(Constants.Image.iconsMessage, for: .normal)
        }
    }
}
