//
//  OptionalChecking.swift
//  SharkID
//
//  Created by Vikram Jagad on 25/02/19.
//  Copyright © 2019 sttl. All rights reserved.
//

import Foundation

// MARK: - Get Value from Dict
func getInteger(anything: Any?) -> Int {
    if let any: Any = anything {
        if let number = any as? NSNumber {
            return number.intValue
        } else if let string = any as? NSString {
            return string.integerValue
        }
    }
    return 0
}

func getInteger64(anything: Any?) -> Int64 {
    if let any: Any = anything {
        if let number = any as? NSNumber {
            return number.int64Value
        } else if let string = any as? NSString {
            return string.longLongValue
        }
    }
    return 0
}

func getString(anything: Any?) -> String {
    if let any: Any = anything {
        if let number = any as? NSNumber {
            return number.stringValue
        } else if let string = any as? String {
            return string
        } else if let arrString = any as? [String] {
            return arrString.joined()
        }
    }
    return ""
}

func getBoolean(anything: Any?) -> Bool {
    if let any: Any = anything {
        if let number = any as? NSNumber {
            return number.boolValue
        } else if let string = any as? NSString {
            return string.boolValue
        }
    }
    return false
}

func getFloat(anything: Any?) -> Float {
    if let any: Any = anything {
        if let number = any as? NSNumber {
            return number.floatValue
        } else if let string = any as? NSString {
            return string.floatValue
        } else if let float = any as? Float {
            return float
        }
    }
    return 0
}
