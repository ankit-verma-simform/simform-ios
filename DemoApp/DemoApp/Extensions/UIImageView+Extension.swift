//
//  ImageView+Extension.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/04/23.
//

import UIKit

extension UIImageView {
    func maskCircle() {
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
