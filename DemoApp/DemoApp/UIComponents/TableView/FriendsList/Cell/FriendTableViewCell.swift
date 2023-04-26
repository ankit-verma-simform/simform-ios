//
//  FriendTableViewCell.swift
//  DemoApp
//
//  Created by Ankit Verma on 25/04/23.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var imgProfile: CircularImageView!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}

// MARK: - Functions
extension FriendTableViewCell {
    func config(_ friend: Friend) {
        lblName.text = friend.firstName + " " + friend.lastName
        lblAge.text = String(friend.age)
        imgProfile.image = friend.image
    }
}
