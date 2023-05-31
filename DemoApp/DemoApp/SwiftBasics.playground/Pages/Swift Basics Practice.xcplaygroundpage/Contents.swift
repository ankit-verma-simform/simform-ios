import Foundation

// MARK: - Basics

let nums: [Int] = [4, 6, 8, 10, 5, 2]

// printing num from nums
print("Nums:")
for num in nums {
    print(num)
}

// summing up ints in array
var sum = 0
print("Sum:", terminator: "")
for (_, num) in nums.enumerated() {
    sum += num
}
print(sum)

// using dictionaries
let emojis = [
    "Ghost" : "👻",
    "Alien monster" : "👾​​",
    "Scream" : "😱"
]
print(emojis["Ghost"] ?? "No such emoji!")

// forced unwrapping
let a: String? = nil
if a != nil {
    print(a!)
}

// optional binding
if let a = a {
    print(a)
}

let b = String()
print(b)

// declaring multiple variables
let x = 3, y = 4.2, z = "random"
print(x)

// using keyword as identifier by wrapping it within ``
//let `Int`:Int = 91
//print(Int)

//type conversions
let three = 3
let pointOneFour = 0.14
let pi = Double(three) + pointOneFour

//using tuples
let httpStatus = (code:404, message:"Not Found")
print(httpStatus.message)

//working with optionals
var possibleNumber = "123"
//let possibleNumber: Int? = nil
let convertedNumber = Int(possibleNumber)

let k: Int? = 6
if var k {
    print(k)
}
//k += 1
//print(k)

//error handling in swift
func canThrowAnError() throws {
    // this function may or may not throw an error
}

//do {
    try canThrowAnError()
    // no error was thrown
//} catch {
//    // an error was thrown
//}

//using assertions and preconditions
let age = +3
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

//precondition(false, "Not met the necessary conditions")

/*
https://stackoverflow.com/questions/29673027/difference-between-precondition-and-assert-in-swift
*/

// MARK: - Variables

var greeting = "Hello, swift"

var mutableVariables: Int = 32
print(mutableVariables)

mutableVariables = 43 //new value can be assigned

let myConstant = "value"
//myConstant = "newValue"  //can't reassign a constant, uncommenting will throw error

//a variable of a specific type can't hold value of another type
//mutableVariables = "stringValue" //uncomment to see error

var uninitializedVariable: Bool //using uninitialized variable throws error
//print(uninitializedVariable) //uncomment to see error

var concatedString = "I'm a " + "concated string" //use + to concat strings
//var cantConcat = concatedString + " " + mutableVariables //swift don't allow implicit type conversion
var cantConcat = concatedString + " " + String(mutableVariables) //explicitly converting Int to String

// MARK: - Loops

//using ranged forloop
for i in 1...10 {
    print(i)
}

//using repeat while
var j = 0
repeat {
    print(j)
    //++j //we don't have pre or
    //j++ //post increment in swift
    j += 1
} while j < 10


//using while
var m = 0
while m < 11 {
    print(m)
    m += 1
}

// MARK: - Conditionals

var marks = 110

//using if-else-if ladder
if marks > 100 || marks < 0 {
    print("Invalid Marks")
}
else if marks > 90 {
    print("A Grade")
}
else if marks > 80 {
    print("B Grade")
}
else if marks > 70 {
    print("C Grade")
}
else if marks > 60 {
    print("D Grade")
}
else {
    print("Failed")
}

var country = "US"
switch country {
case "US":
    print("United States of America")
case "IND":
    print("India")
default:
    print("Unknown country")
}
