
/*
 Name: Ankit Verma
 Topic: Enumerations Exercise
 */

/*
 Question: 1
Write swift program using enumerations to check week day from given number.
Consider Monday as 1 and Sunday as 7. We can be able to get day name as string in short form (sun, mon,...) and same full name (Sunday, Monday...) by given number of the day.

 */

enum Weekday: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday

    var shortName: String {
        switch day {
        case .Sunday: return "sun"
        case .Monday: return "mon"
        case .Tuesday: return "tue"
        case .Wednesday: return "wed"
        case .Thursday: return "thu"
        case .Friday: return "fri"
        case .Saturday: return "sat"
        }
    }
    
    var fullName: String {
        return "\(self)"
    }
}

let day = Weekday(rawValue: 4) ?? Weekday.Sunday
print("Shortform of today's day:", day.shortName)
print("Fullform of today's day:", day.fullName)

/*
 Question: 2
 Create one enumeration program to return number of days in a month.
 */

enum Month {
    case jan, feb, mar, apr, may, june, july, aug, sept, oct, nov, dec
    
    func noOfDays() -> Int {
        switch self {
        case .jan, .mar, .may, .july, .aug, .oct, .dec: return 31
        case .apr, .june, .sept, .nov: return 30
        case .feb: return 28
        }
    }
}

let month = Month.mar
print("Number of days in \(month): \(month.noOfDays())")

/*
 Question: 3
 Write a swift program using enumerations to demonstrate Int enums.
 */

enum Direction: Int {
    case north = 1, east, south, west
}

let directionToGo = Direction(rawValue: 3)
if let directionToGo {
    print("I want to go \(directionToGo) :)")
}
else {
    print("I've no where to go!")
}

/*
 Question: 4
 Write a swift program to demonstrate string type enum.
 */

enum Color: String {
    case white = "#ffffff"
    case black = "#000000"
    case red = "#ff0000"
    case green = "#00ff00"
    case blue = "#0000ff"
}

let color = Color(rawValue: "#00ff00") ?? Color.white
print("Paint my car: \(color)")

/*
 Question: 5
 Write a swift program for enum with raw values.
 */

enum UserType: String {
    case admin = "administrator"
    case mod = "moderator"
    case player = "player"
}

let loggedInUser = UserType.admin
print("I'm a/an", loggedInUser.rawValue)

/*
 Question: 6
 Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and without use of CaseIterable(Mandatory).
 */

// with CaseIterable
enum Vowel: CaseIterable { case a, e, i, o, u }
print("Vowels:", terminator: "")
for vowel in Vowel.allCases {
    print(vowel, terminator: "")
}
print()

// without CaseIterable
enum Beverage {
    case coffee, tea, juice
    static let allCases = [coffee, tea, juice]
}
print("Beverages:", terminator: "")
for beverage in Beverage.allCases {
    print(beverage, terminator: "")
}
print()

/*
 Question: 7
 Write a swift program using enumerations for learn and demonsrate enum cases with parameters (Enum with associated values).
 */

enum Response {
    case loading
    case success(data: String)
    case failure(error: Error)
}

enum MyError: Error {
    case networkError
    case userError
}

let response = Response.failure(error: MyError.networkError)
switch response {
case .loading: print("Show loading spinner")
case .failure(let error): print("Operation failed! \(error)")
case .success(let data): print("Success! \(data)")
}
 
/*
 Question: 8
 Create an enum with its rawValues of type String and show usage of case to print value of case.
 */

enum AccountType: String {
    case savings = "savings account"
    case current = "current account"
}
let myAccount = AccountType.savings
print("My account type:", myAccount.rawValue)
