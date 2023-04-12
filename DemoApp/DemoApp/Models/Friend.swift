//
//  Friend.swift
//  DemoApp
//
//  Created by Ankit Verma on 25/04/23.
//

import UIKit

struct Friend {
    var image: UIImage?
    var firstName = ""
    var lastName = ""
    var age = 0
    var isSelected = false
    
    func validEntries() -> Bool {
        return image != nil
        && firstName.isNotEmpty
        && lastName.isNotEmpty
        && age > 0
    }
}
