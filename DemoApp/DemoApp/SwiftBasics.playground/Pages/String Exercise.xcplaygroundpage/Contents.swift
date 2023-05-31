/*
 Name: Ankit Verma
 Topic: Exercise Working with Text
 Exercise: https://simformsolutionspvtltd-my.sharepoint.com/:w:/g/personal/ketan_c_simformsolutions_com/EZu37VQNeyZEloJqlEyMbMQBePdx09kWHAJ6F5HKvEvUMA?e=J1OMZE
 */

import Foundation

// 1) Return first 2 characters
var myString = "Simform"
print(myString.prefix(2))
print()

// 2) Return string without first and last character
var inputString = "Simform"
var anotherString = inputString // creates a new string copy
assert(anotherString.count >= 2, "String must be of at least 2 characters")
anotherString.removeFirst()
anotherString.removeLast()
print(anotherString)
print()

// 3) Return strings concated without first characters
var str1 = "Swift", str2 = "Examples"
assert(str1.count >= 1 && str2.count >= 1, "Strings must of be at least 1 character")
str1.removeFirst()
str2.removeFirst()
print(str1 + str2)
print()

// 4) Returns circular shifted string
var str = "Swift"
assert(str.count >= 2, "String must be of at least 2 characters")
var firstTwoCharacters = str.prefix(2)
var remainingCharacters = str.dropFirst(2)
str = String(remainingCharacters + firstTwoCharacters)
print(str)
print()

// 5) Check string starts with `Sw`
var givenString = "Swift"
assert(givenString.count >= 2, "String must be of at least 2 characters")
print("String starts with `Sw`:", givenString.hasPrefix("Sw"))
print()

// 6) Returns string with first n chars combined with last n chars
var someString = "Simform Solutions", n = 3
assert(n > 0 && someString.count >= n, "String must be of at least n characters")
print(someString.prefix(n) + someString.suffix(n))
print()

// 7) Try String methods: https://developer.apple.com/documentation/swift/string
var testString = "sOmeRandomStRingToTest"
print("String:", testString)
print("Lowercase", testString.lowercased())
print("Uppercase", testString.uppercased())
print("Capitalize", testString.capitalized)
print("Length", testString.count)
print("First character", testString.first ?? "String is empty, no first character")
print("First character", testString.last ?? "String is empty, no last character")
print("Is Empty?", testString.isEmpty)
print("UTF8", testString.utf8)
print("UTF16", testString.utf16)
print("Reversed", String(testString.reversed()))
