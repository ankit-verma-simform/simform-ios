//
//  DynamicArray.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

enum ListenerToFire {
    case add
    case remove
    case defaults
}

class DynamicArray<T>: DynamicAsync<[T]> {
    
    // MARK: typealias
    typealias RemoveListener = (Int) -> Void
    typealias AddListener = ((Int)) -> Void
    
    // MARK: Vars & Lets
    var removeListener: RemoveListener?
    var appendListener: AddListener?
    var listenerToFire = ListenerToFire.defaults
    
    override func fire() {
        if listenerToFire == .defaults {
            listener?(value)
        }
        self.listenerToFire = .defaults
    }
    
    // MARK: Public methods
    func append(_ element: T) {
        self.listenerToFire = .add
        self.value.append(contentsOf: [element])
        self.appendListener?(value.count)
    }
    
    func append(_ contentsOf: [T]) {
        self.listenerToFire = .add
        self.value.append(contentsOf: contentsOf)
        self.appendListener?(contentsOf.count)
    }
    
    func remove(_ at: Int) {
        self.listenerToFire = .remove
        self.value.remove(at: at)
        self.removeListener?(at)
    }
    
    func bindRemoveListener(_ listener: RemoveListener?) {
        self.removeListener = listener
    }
    
    func bindAppendListener(_ listener: AddListener?) {
        self.appendListener = listener
    }
    
}
