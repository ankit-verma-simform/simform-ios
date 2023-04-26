//
//  Friend.swift
//  DemoApp
//
//  Created by Ankit Verma on 25/04/23.
//

import UIKit

struct Friend {
    var image: UIImage?
    var firstName: String = ""
    var lastName: String = ""
    var age: Int = 0
    
    func validEntries() -> Bool {
        return image != nil
        && firstName.isNotEmpty
        && lastName.isNotEmpty
        && age > 0
    }
}
