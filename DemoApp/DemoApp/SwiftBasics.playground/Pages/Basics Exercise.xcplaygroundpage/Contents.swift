// MARK: HelloWorld in Swift Playground
var greeting = "Hello, world"
print(greeting, terminator: "\n")

// MARK: Variables
var myLuckyNumber = 7 // type inferred
var isSunnyDay: Bool = true // type annotation
let π: Float = 3.14159 //can use unicode character as identifier
let name: String
name = "Ankit Verma"
print(name, "'s lucky number is ", myLuckyNumber, separator: "")
print("Value of pi = ", π, separator: "")
print("Is today sunny?", isSunnyDay)

// Addition with 5
var myNumber = 17
print(myNumber + 5)

// Calculate Interest
let interestRate: Double = 15
var duration: Double = 2
var amount: Double = 1000
let interest = (amount * interestRate * duration) / 100

// MARK: Operator
// string concate
var favouriteFruit = "mango"
var message = "Favourite fruit is " + favouriteFruit
print(message)

// operator usage using ints
var num1 = 7
var num2 = 3
var sum = num1 + num2
var product = num1 * num2
var quotient = num1 / num2

// operator usage using floats
var num3 = 7.2
var num4 = 3.0
var sumDouble = num3 + num4
var productDouble = num3 * num4
var quotientDouble = num3 / num4

// ternary operator
// this operator is use to assign exression to variable based on value of
// condition evaluated to true or false
var myPlan = isSunnyDay ? "Go to play" : "Stay indoors"
