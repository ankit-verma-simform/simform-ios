//
//  UIView+Extension.swift
//  DemoApp
//
//  Created by Ankit Verma on 20/04/23.
//

import UIKit

extension UIView {
    func maskCircle() {
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
