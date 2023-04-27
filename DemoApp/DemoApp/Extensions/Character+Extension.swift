//
//  Character+Extension.swift
//  DemoApp
//
//  Created by Ankit Verma on 27/04/23.
//

extension Character {
    var indexedValue: Int? {
        guard isLetter, let value = asciiValue else {
            return nil
        }
        return Int(value) - (isLowercase ? 97 : 65)
    }
}
