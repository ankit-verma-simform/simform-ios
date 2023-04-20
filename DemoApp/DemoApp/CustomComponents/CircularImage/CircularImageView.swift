//
//  CircularImageView.swift
//  DemoApp
//
//  Created by Ankit Verma on 20/04/23.
//

import UIKit

class CircularImageView: UIImageView {

    override func layoutSubviews() {
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
