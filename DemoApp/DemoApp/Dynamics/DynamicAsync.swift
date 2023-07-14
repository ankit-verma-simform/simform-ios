//
//  DynamicAsync.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class DynamicAsync<T>: Dynamic<T> {

    // MARK: Ovverides
    override func fire() {
        self.listener?(self.value)
    }

    // MARK: Initialization
    override init(_ v: T) {
        super.init(v)
    }
}
