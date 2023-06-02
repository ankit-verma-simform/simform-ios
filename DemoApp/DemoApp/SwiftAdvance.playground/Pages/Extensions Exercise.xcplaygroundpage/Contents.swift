/*
 Name: Ankit Verma
 Topic: Extensions Exercise
 */

import Foundation

/*
 Questions:
 Create following string manipulation functions using string extensions
 */

//  Add a character in a string at 5th position
extension String {
    func index(_ position: Int) -> Index {
        return index(startIndex, offsetBy: position-1)
    }
}

extension String {
    mutating func addAt5thPosition(char: Character) {
        let idx5 = index(4)
        insert(char, at: idx5)
    }
}
var str = "abcdef"
str.addAt5thPosition(char: "E")
print("Modified string:", str)

// Replace one character with other in a string
extension String {
    mutating func replace(_ thisCharacter: Character, with thatCharacter: Character) {
        self = NSString(string: self).replacingOccurrences(
                    of: "\(thisCharacter)", with: "\(thatCharacter)")
    }
}
var newStr = "abcaba"
print("newStr:", newStr)
newStr.replace("a", with: "+")
print("Replaced all a with +:", newStr)

// Remove white spaces from string
extension String {
    func removeSpaces() -> String {
        var newString = ""
        for char in self where char != " " {
            newString += String(char)
        }
        return newString
    }
}
let stringWithSpaces = "This Is String With Spaces"
let stringWithoutSpaces = stringWithSpaces.removeSpaces()
print("String with spaces:", stringWithSpaces)
print("String without spaces:", stringWithoutSpaces)

// Get number of words in a string
extension String {
    var wordCount: Int {
        var whitespaceCount = 0
        let trimmedString = self.trimmingCharacters(in: [" ", "\t", "\n"])
        for char in trimmedString where char == " " {
            whitespaceCount += 1
        }
        return whitespaceCount + 1
    }
}
let randomString = "this is a random string with 8 words"
print("'\(randomString)' contain \(randomString.wordCount) words!")
