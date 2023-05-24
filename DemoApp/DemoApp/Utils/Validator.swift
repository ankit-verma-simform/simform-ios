//
//  Validator.swift
//  DemoApp
//
//  Created by Ankit Verma on 21/04/23.
//
//

import Foundation

extension String {
    var isNotEmpty: Bool {
        !isEmpty
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        let result = try? NSRegularExpression(pattern: emailRegEx, options: .caseInsensitive)
            .firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))
        return isNotEmpty && result != nil
    }
    
    var isValidPassword: Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let result = try? NSRegularExpression(pattern: passwordRegEx)
            .firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))
        return isNotEmpty && result != nil
    }
}
