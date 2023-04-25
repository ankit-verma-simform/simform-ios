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
    }
}

// MARK: - Functions
extension FriendTableViewCell {
    func config(_ friend: Friend) {
        guard let firstName = friend.firstName,
              let lastName = friend.lastName,
              let image = friend.image,
              let age = friend.age else {
            return
        }
        lblName.text = firstName + " " + lastName
        lblAge.text = String(age)
        imgProfile.image = image
    }
}
