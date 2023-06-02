/*
    Name: Ankit Verma
    Topic: Exercise Properties, Methods, Subscripts, Inheritance
*/

import Foundation

/*
    Question:
    Create an example using swift to demonstrate use of get only properties.
    Create a class with a property which value cannot be set outside of class.
    Output: for example, your class Demo has one property of string type
    then you can be able to set it within a class.
    If I try set it outside of class it must give an error.
*/

class Demo {
    private var _value: String
    var value: String {
        return _value
    }

    init(value: String) {
        self._value = value
    }
    
    func changeValue(to newValue: String) {
        self._value = newValue
    }
}

var demo = Demo(value: "demo string")
print(demo.value) // can get demo value
// demo.value = "new demo value" // this will throw error as value is get only property!
demo.changeValue(to: "new value")
print(demo.value, "\n") // can get demo value

/*
    Question:
    Create a swift program to demonstrate usage of computed properties using getter and setter.
*/

class AgeCalc {
    var bornYear: Int
    private let currentYear: Int
    
    var age: Int {
        get {
            currentYear - bornYear
        }
        set(newAge) {
            bornYear = currentYear - newAge
        }
    }
    
    init?(bornYear: Int) {
        let currentYear = Calendar.current.component(.year, from: Date())
        guard bornYear <= currentYear else {
            return nil
        }
        self.currentYear = currentYear
        self.bornYear = bornYear
    }
}

if let ageCalc = AgeCalc(bornYear: 2000) {
    print("My age is", ageCalc.age)
    ageCalc.age = 15 // setting new age
    print("If my age is \(ageCalc.age) then I was born in \(ageCalc.bornYear)!\n")
}

/*
    Question:
    Create a swift program to show usage of stored properties.
*/

struct Point {
    var x: Double
    var y: Double
    
    func distance(from point: Point) -> Double {
        return sqrt(pow(x - point.x, 2) + pow(y - point.y, 2))
    }
}

let point1 = Point(x: 4, y: 3)
let point0 = Point(x: 0, y: 0)
print("\(point1) is \(point1.distance(from: point0)) distance away from \(point0)\n")

/*
    Question:
    Create a swift program which has private properties which cannot directly be accessed.
    Means we cannot directly read or write it.
*/

struct Wallet {
    enum WalletError : Error {
        case InvalidCredentials, InsufficiantBalance, InsufficiantAmount
    }
    
    private var pin: String
    private (set) var username: String
    private var balance: Int = 0
    
    init(username: String, pin: String) {
        self.username = username
        self.pin = pin
    }

    mutating func deposit(amount: Int) {
        guard amount > 0 else {
            return
        }
        balance += amount
    }

    func checkBalance(username: String, pin: String) throws -> Int {
        guard username == self.username && pin == self.pin else {
            throw WalletError.InvalidCredentials
        }
        return balance
    }
}

var wallet = Wallet(username: "Ankit", pin: "9876")
wallet.deposit(amount: 345)
print("Username is", wallet.username)
// wallet.username = "James" // can't change username, can only read
do {
    print("Balance is Rs.", try wallet.checkBalance(username: "Ankit", pin: "9876"), "\n")
}
catch {
    print("Error occured while checking balance! \(error)\n")
}

/*
    Question:
    Create one swift class which have two properties name and id,
    the class must have one initializer to set that properties.
    And create one array of that class types.
    Output:
    My class is Person and properties are id and name, then create an array of person.
    And print all elements of that array.
*/

class Person {
    var id: Int
    var name: String
    
    init(_ id: Int, name: String) {
        self.id = id
        self.name = name
    }

    var description: String {
        "Person(id: \(id), name: \(name))"
    }
}

let people = [
    Person(1, name: "Mike"),
    Person(2, name: "Sam"),
    Person(3, name: "James"),
    Person(4, name: "Harry"),
]
people.forEach { print($0.description) }

/*
    Question:
    Create one example of usage of willSet and didSet.
*/

struct Deviation {
    var number: Int {
        willSet {
            print("Number will now become \(newValue) from \(number)")
        }
        didSet {
            print("Number become \(number) from \(oldValue)")
        }
    }
}

var dev = Deviation(number: -7)
print("\nNumber is", dev.number)
dev.number = 3
print("Number is", dev.number, "\n")

/*
    Question:
    Create one lazy stored property in a class and show usage of it.
*/

struct Accountant {
    init() {
        print("Accountant created!")
    }
    func doWork() {
        print("Accountant worked to prepare financial statements!")
    }
}

class Manager {
    lazy var accountant = Accountant()
    init() {
        print("Manager created!")
    }

    func prepareFinancialReport() {
        accountant.doWork()
    }
}

var manager = Manager() // accountant is not created now
manager.prepareFinancialReport() // for financial report, we need accountant to work, hence he is called!
print()

/*
    Question:
    Create one class as Base type Person which has common properties like name, occupation, etc.
    Create two child classes from the person which are Student, Employee and this two-child classes must have
    base properties and some other properties also.
    Example, student have college, but Employee have company. And demonstrate the usage of inheritance.
*/

class PersonBase {
    var name: String
    var occupation: String
    init(name: String, occupation: String) {
        self.name = name
        self.occupation = occupation
    }
}

class Student: PersonBase {
    var id: String
    var college: String
    var cgpa: Double

    init(id: String, name: String, college: String, cgpa: Double) {
        self.id = id
        self.college = college
        self.cgpa = cgpa
        super.init(name: name, occupation: "student")
    }
}

class Employee: PersonBase {
    var id: String
    var company: String
    var role: String

    init(id: String, name: String, company: String, role: String) {
        self.id = id
        self.company = company
        self.role = role
        super.init(name: name, occupation: "employee")
    }
}

let jil = PersonBase(name: "Jil", occupation: "pilot")
let ram = Employee(id: "134", name: "Ram", company: "MLS", role: "SDE")
let akash = Student(id: "1234", name: "Akask", college: "DPS", cgpa: 9.7)

print(jil.name, "is a", jil.occupation)
print(ram.name, "is a", ram.occupation, "in", ram.company, "(\(ram.role))")
print(akash.name, "is a", akash.occupation, "in", akash.college, "with", akash.cgpa, "cgpa\n")

/*
    Question:
    Create one structure to show usage of mutating function in swift.
*/

struct Counter {
    var count: Int = 0
    mutating func increment() {
        count += 1
    }
}

var counter = Counter()
counter.increment()
print("Counter incremented to \(counter.count)!\n")

/*
    Question:
    Create one class inheritance demo to show usage of method overriding.
*/

class Sportsperson {
    func greet() {
        print("I'm a sports person!")
    }
}

class Cricketer: Sportsperson {
    override func greet() {
        print("I'm a cricketer!")
    }
}

let het = Sportsperson()
het.greet()
let aman = Cricketer()
aman.greet()
print()

/*
    Question:
    Create one swift class to show usage of type methods.
*/

class MathsOps {
    static func add<T: Numeric>(a: T, b: T) -> T {
        return a + b
    }

    static func diff<T: Numeric>(a: T, b: T) -> T {
        return a - b
    }

    static func multiply<T: Numeric>(a: T, b: T) -> T {
        return a * b
    }
}
print("5 x 7 =", MathsOps.multiply(a: 5, b: 7))

/*
    Question:
    Create one swift class which is having class method and static method.
    Then in one child class try to override that methods and check the output/ error.
    (you will learn difference between class and static)
*/

class Parent {
    class func allowOverrideInChild() {
        print("This method is class type so it will be able override in subclass!\n")
    }
    static func wontOverrideInChild() {
        print("This method is static type so it will not be able to override in subclass!\n")
    }
}

class Child: Parent {
    override class func allowOverrideInChild() {
        print("Overridden class method in child!")
    }

    // override static func wontOverrideInChild() {
    //     print("This will throw error!")
    // }
}

/*
    Question:
    Create one example of subscript using array.
    Create one array of weekdays and one subscript func which takes int as argument and
    returns day of week.
    Output: WeekDays.subscript(day: 1) // will return Sunday Note: Handle invalid input.
*/

struct Weekday {
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    subscript(day: Int) -> String? {
        guard (1...7).contains(day) else {
            return nil
        }
        return days[day-1]
    }
}
if let weekday = Weekday()[1] {
    print("\nWeekday is \(weekday)!\n")
}

/*
    Question:
    Create a swift program to show usage of subscript in string.
    I pass int argument and it returns the character at given position.
*/

extension String {
    subscript(position: Int) -> Character? {
        guard (1...count).contains(position) else {
            return nil
        }
        let characterIndex = index(startIndex, offsetBy: position-1)
        return self[characterIndex]
    }
}
print("4th position of `Hello Swift` is", "Hello Swift"[4] ?? "not found", "\n")

/*
    Question:
    Create one swift subscript program which takes range as input and returns the string between the ranges.
*/

extension String {
    subscript(range: ClosedRange<Int>) -> String? {
        guard range.lowerBound >= 0 && range.upperBound < count else {
            return nil
        }
        let seqStartIndex = index(startIndex, offsetBy: range.lowerBound)
        let seqLastIndex = index(startIndex, offsetBy: range.upperBound)
        return String(self[seqStartIndex...seqLastIndex])
    }
}
print("some string"[0...3] ?? "not found!", "\n")

/*
    Question:
    I have one integer array and create one function which takes range as input and
    returns all elements between the range.
*/

extension Array where Element == Int {
    func giveSubrange(range: ClosedRange<Int>) -> [Int]? {
        guard range.lowerBound >= 0 && range.upperBound < count else {
            return nil
        }
        return Array(self[range])
    }
    
}
print(Array(1...100)[3...5], "\n")

/*
    Question:
    I have one key value pair array. Create one function using subscript which takes key as input
    and returns it’s value.
    Output: let array = [[1: “Hello”], [2: “Hi..”]]
    Now call function subscript(at: 1) it should print "Hello”
*/

struct KeyValue {
    let array = [[1: "Hello"], [2: "Hi.."]]
    subscript(at key: Int) -> String {
        if let dict = array.first(where: { $0.keys.contains(key) }),
           let value = dict[key] {
               return value
        }
        return "not found!"
    }
}

var keyValue = KeyValue()
print(keyValue[at: 14]) // not found!
print(keyValue[at: 1])  // found!

/*
    Question:
    Create one array of type Person and create one subscript function
    which takes person name as input and returns person info like name, age, birthdate etc.
*/

struct AdvancePerson {
    var name: String
    var age: Int
    var birthdate: String
}

extension Array where Element == AdvancePerson {
    subscript(name: String) -> String {
        if let person = first(where: { $0.name == name }) {
            return "\(person)"
        }
        return "no person with name \(name) found!"
    }
}

let advancePeople = [
    AdvancePerson(name: "Akhil", age: 15, birthdate: "2008"),
    AdvancePerson(name: "Mukesh", age: 18, birthdate: "2005"),
    AdvancePerson(name: "Kevin", age: 5, birthdate: "2018"),
]
print()
print(advancePeople["Kevin"])

/*
    Question:
    Create one base class of type Song and create subclasses of music types
    (Hip-Hop, classical) and show usage of inheritance. // Here Music class have property singer, composer
*/

class Music {
    var singer: String
    var composer: String

    init(singer: String, composer: String) {
        self.singer = singer
        self.composer = composer
    }

    func brief() {
        print("Composed by \(self.composer), Music by \(self.singer)!")
    }
}

class HipHop: Music {
    override func brief() {
        print("This is hiphop music!")
        super.brief()
    }
}

class Classical: Music {
    override func brief() {
        print("This is classical music!")
        super.brief()
    }
}

let hiphop = HipHop(singer: "David", composer: "Taylor")
print()
hiphop.brief()

/*
    Question:
    Create a swift class with properties which can be read-write outside of class.
*/

class WaterBottle {
    var water: Int = 0
}

let melton = WaterBottle()
melton.water += 1000
melton.water -= 300
print("\nCurrent amount of water in bottle is \(melton.water) ml!")
