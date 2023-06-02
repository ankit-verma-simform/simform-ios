/*
    Name: Ankit Verma
    Topic: Classes Exercise
*/

/*
    Question:
    Create a swift program to demonstrate swift class.
    Which has two variables inside class body.
    Access (Set its values and get its value.) these variables by creating one instance of class.
*/

class ProgrammingLanguage {
    let name: String
    var popularity: Float
    
    init(name: String) {
        self.name = name
        self.popularity = 5.0
    }
}

let swift = ProgrammingLanguage(name: "Swift")
swift.popularity += 3.7
print("\n=== Programming Language ===")
print("\(swift.name) is a wonderful programming language.")
print("It's popularity reached \(swift.popularity) in scale of 1 to 10.0\n")

/*
    Question:
    Create a swift program to demonstrate usage of swift class for usage of multiple initializers.
    Create one initializer with two parameters your name and college and another initializer with your name
    and department. You can be able to access these properties using instance of class.
*/

class Student {
    let name: String
    var college: String
    var department: String

    convenience init(name: String, college: String) {
        self.init(name: name, department: "I.T.", college: college)
    }

    convenience init(name: String, department: String) {
        self.init(name: name, department: department, college: "Vishwakarma Government Engineering College")
    }

    init(name: String, department: String, college: String) {
        self.name = name
        self.department = department
        self.college = college
    }

    func introduce() {
        print("Hi, I'am \(name). I am studying \(department) from \(college)!")
    }
}

let ankit = Student(name: "Ankit Verma", college: "VGEC")
ankit.introduce()
ankit.college = "Vishwakarma Government Engineering College"
ankit.introduce()

/*
    Question:
    Create a swift class without initializers and access (write, read) its properties using instance of class.
*/

class MagicBox {
    var magicNumber: Int?
    var luckyColor: String?
    var luckyTime: String {
        return "12:00 pm"
    }
    func unfold() {
        print("Lucky color is \(luckyColor ?? "black")")
        print("Magic number is \(magicNumber ?? 1)")
        print("Lucky time is \(luckyTime)")
    }
}

let magicBox = MagicBox()
print("\nToday my lucky time is \(magicBox.luckyTime)")
magicBox.magicNumber = 7
magicBox.luckyColor = "gold"
print("Today's draw:")
magicBox.unfold()

/*
    Question:
    Create a swift class which is having code to return square of given number and
    access this code using class instance.
*/

class MathOps {
    var num: Int
    init(on num: Int) {
        self.num = num
    }
    func squareIt() -> Int {
        return num * num
    }
}

let mathOps = MathOps(on: 9)
let squaredNumber = mathOps.squareIt()
print("\nSquare of \(mathOps.num) is \(squaredNumber)!\n")

/*
    Question:
    Create a swift class example to show use of swift inheritance.
    Your base class has some property access this property.
    In two different child classes and show its usage using the instances of both child classes.
*/

class Person {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func eat() {
        print("\(name) eats food!")
    }

    func growOld() {
        age += 1
        print(name, "is now", age, "years old!")
    }

    func sleep() {
        print("\(name) sleeps like a log!")
    }
}

class Teacher: Person {
    var school: String
    var subject: String

    init(name: String, age: Int, school: String, subject: String) {
        self.school = school
        self.subject = subject
        super.init(name: name, age: age)
    }

    func teach() {
        print("Teaching \(subject) in \(school)")
    }
}

class Athlete: Person {
    var sports: String
    
    init(name: String, age: Int, sports: String) {
        self.sports = sports
        super.init(name: name, age: age)
    }

    func play() {
        print("\(name) plays \(sports)")
    }
}

let dhoni = Athlete(name:"MS Dhone", age: 41, sports: "Cricket")
dhoni.play()
dhoni.growOld()

var lokesh = Teacher(name: "Lokesh Patel", age: 45, school: "New Sunrise", subject: "Maths")
lokesh.school = "Snow Village"
lokesh.subject = "Physics"
print("It's lunch time!")
lokesh.eat()

/*
    Question:
    Create a swift class example to show use of swift base class which have some implementation inside any method.
    Now demonstrate usage of overriding that method implementation.
*/

class Bowler: Athlete {
    init(name: String, age: Int) {
        super.init(name: name, age: age, sports: "Cricket")
    }
    
    func throwBall() {
        print("\(name) throws ball to stumps!")
    }
}

class LegSpinner: Bowler {
    override func throwBall() {
        print("\(name) throws ball with a spin to left leg into stumps!")
    }
}

let bumrah = Bowler(name: "Jasprit Bumrah", age: 29)
let anilKumble = LegSpinner(name: "Anil Kumble", age: 52)
print()
bumrah.throwBall()
anilKumble.throwBall()

/*
    Question:
    Create a swift class with an initializer in a manner that you can create this class using initializing value.
    And one function which takes int input and returns the power of class instance.
    example:
    let instance = Example(value: 5)
    let result = instance.doPower(power: 3)
    then it should return 5's 3 power (125)
*/

class MathUtils {
    var num: Int
    
    init(num: Int) {
        self.num = num
    }
    
    func power(to exp: Int) -> Int {
        var result = 1
        for _ in 1...exp {
            result *= num
        }
        return result
    }
}

let mathUtils = MathUtils(num: 4)
print("\n", mathUtils.num, "^ 6 =", mathUtils.power(to: 6), "\n")

/*
    Question:
    Create a swift class example which has a parent class for vehicles, and child classes
    for two different vehicles e.g. (bike & car).
    You need to use common properties and method in the parent class and inside child class,
    there will be some different property which is not common.
*/

class Vehicle {
    enum FuelType {
        case petrol, diesel
    }
    
    let noOfWheels: Int
    let capacity: Int
    let fuelType: FuelType

    init(noOfWheels: Int, capacity: Int, fuelType: FuelType) {
        self.noOfWheels = noOfWheels
        self.capacity = capacity
        self.fuelType = fuelType
    }

    func startEngine() {
        print("Vehicle's engine started!")
    }

    func stopEngine() {
        print("Vehicle's engine stopped!")
    }

    func speedUp() {
        print("Vehicle speed increased!")
    }

    func speedDown() {
        print("Vehicle speed decreased!")
    }

    func drive() {
        print("Driving vehicle!")
    }
}

class Bike: Vehicle {
    init() {
        super.init(noOfWheels: 2, capacity: 2, fuelType: FuelType.petrol)
    }

    func drift() {
        print("Drifting bike!")
    }
}

class Car: Vehicle {
    let noOfDoors: Int
    let hasSunroof: Bool
    
    init(capacity: Int, noOfDoors: Int = 4, hasSunroof: Bool = false) {
        self.noOfDoors = noOfDoors
        self.hasSunroof = hasSunroof
        super.init(noOfWheels: 4, capacity: capacity, fuelType: FuelType.petrol)
    }

    func travelLong() {
        print("Travelling long distance on car!")
    }
}

let bike = Bike()
print("\nBike runs on \(bike.fuelType)")
bike.drift()
let car = Car(capacity: 7)
car.drive()
car.travelLong()
print("My car has \(car.hasSunroof ? "a" : "no") sunroof!\n")

/*
    Question:
    Create a person swift class with person name initializer and create one function to greet that person.
    Example:
    let person1 = Person(name: Joe)
    person1.greet() // This should print “Hello Joe”
*/

class Human {
    let name: String

    init(name: String) {
        self.name = name
    }

    func greet() {
        print("Hello \(name)")
    }
}

let person1 = Human(name: "Joe")
person1.greet()

/*
    Question:
    Create a swift class with some property.
    And then set its value using initializer of class, then perform below actions.
    let example1 = Example()
    example1.a = “Hello”
    let example2 = example1
    example2.a = “Hi”
    print(example1.a)
    print(example2.a) // Consider ‘a’ as string property of example class.
    --> Check these two print outputs and try to find out the reason for that output.
*/

class Example {
    var a: String
    
    init() {
        self.a = "a"
    }
}

let example1 = Example()
example1.a = "Hello"
let example2 = example1
example2.a = "Hi"
print(example1.a)
print(example2.a) // Consider ‘a’ as string property of example class.

/*
Answer:
Classes are reference types
so when we write `let example2 = example1`, it created a new variable example2 which also refer to same
object to which example1 refers to, so when we change value of a property of example2, it also affected
the example1 as both referring to same object in memory
Hence, example1.a and example2.a prints "Hi"
*/
