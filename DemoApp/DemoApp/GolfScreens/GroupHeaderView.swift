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
    static let identifier = "GroupHeaderView"
    weak var delegate: MessageAllDelegate?
    private var group: Group?
    private var groupIndex = Int()
    
    // MARK: - IB Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var lblGroupName: UILabel!
    @IBOutlet private weak var scoreStackView: UIStackView!
    @IBOutlet private weak var imgMessage: UIButton!
    
    // MARK: - Properties
    override var reuseIdentifier: String? {
        return "GroupHeaderView"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBordersAndCornersToGroupHeader()
    }
}

// MARK: - IB Actions
extension GroupHeaderView {
    @IBAction private func btnMessageAllAction(_ sender: UIButton) {
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
        imgMessage.setImage(messageAllSent ? Constants.Image.iconCheckMark : Constants.Image.iconsMessage, for: .normal)
    }
    
    private func addBordersAndCornersToGroupHeader() {
        containerView.layer.sublayers?.removeAll(where: { caLayer in
            return caLayer.name == "borderLayer" || caLayer.name == "cornerShapeLayer"
        })
        containerView.roundCorners(cornerRadius: 20, top: true)
        containerView.layer.addBorder(side: .top,
                                      thickness: 1,
                                      color: Constants.Color.lightWhite,
                                      maskedCorners: CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner))
        containerView.layer.addBorder(side: .left,
                                      thickness: 1,
                                      color: Constants.Color.lightWhite)
        containerView.layer.addBorder(side: .right,
                                      thickness: 1,
                                      color: Constants.Color.lightWhite)
        containerView.clipsToBounds = true
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
