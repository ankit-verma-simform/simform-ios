/*
    Name: Ankit Verma
    Topic: Structure Exercise
*/

/*
    Question:
    Create one structure of type Work, which have some properties like work location,
    work hours and one string array of project names.
    And create a function inside structure which returns all project names for the person.
*/

struct Work {
    var location: String
    var hours: Int
    var projects: [String]

    func getAllProjects() -> [String] {
        return projects
    }
}

let work = Work(location: "India", hours: 340, projects: ["News App", "Notes App", "Weather App"])
print("All projects:", work.getAllProjects())

/*
    Question:
    Create a structure example which demonstrates use of initializer in structures.
*/

struct Dice {
    var face: Int = 1
    var sides: Int
    
    init?(sides: Int = 6) {
        guard sides > 0 else {
            return nil
        }
        self.sides = sides
    }

    mutating func roll() -> Int {
        face = Int.random(in: 1...sides)
        return face
    }

    func seeFace() -> Int {
        return face
    }
}

if var dice = Dice(sides: 4) {
    print("\nWe get \(dice.roll()) on the \(dice.sides) sided dice!\n")
}

/*
    Question:
    Create a structure program which can be initialized with parameters and
    it also should be able to initialized without parameters.
*/

struct Player {
    var name: String
    var hp: Int
    var mp: Int
    var damage: Int

    init(_ name: String = "Player 1") {
        self.name = name
        hp = 100
        mp = 50
        damage = 10
    }
}

var alex = Player("Alex")
print(alex.name, "has", alex.hp, "hp.")

var ghost = Player()
print(ghost.name, "has", ghost.mp, "mp.\n")

/*
    Question:
    Create one structure which have initializer which takes array of int as input returns two arrays
    one of all even numbers and another is all odd numbers.
    Input: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12]
    Output:
    even numbers are: [6, 8, 10, 8, 12]
    Odd numbers are: [1, 3, 5, 9, 7]
*/

struct NumsManipulator {
    var nums: [Int]
    func seperatelyReturnOddsAndEvens() -> (odds: [Int], evens: [Int]) {
        let evens = nums.filter { $0 % 2 == 0 }
        let odds = nums.filter { $0 % 2 != 0 }
        return (odds, evens)
    }
}

let numsManipulator = NumsManipulator(nums: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12])
let (odds, evens) = numsManipulator.seperatelyReturnOddsAndEvens()
print("Even numbers are:", evens)
print("Odd numbers are:", odds, "\n")

/*
    Question:
    Create one swift structure program for person that contains basic details like name, age, gender.
    Then create one array of person with all details. Print all details of that array.
    // Consider two persons array for Joe and Harry. But in your code Its size can be vary.
    Output be like:
    Name: Joe, Gender: Male, Age: 27
    Name: Harry, Gender: Male, Age: 21
*/

struct Person {
    enum Gender { case Male, Female }
    
    var name: String
    var age: Int
    var gender: Gender

    func printDetails() {
        print("Name: \(name), Gender: \(gender), Age: \(age)")
    }
}

var people = [
    Person(name: "Joe", age: 27, gender: Person.Gender.Male),
    Person(name: "Harry", age: 21, gender: Person.Gender.Male),
]
people.forEach { $0.printDetails() }
print()

/*
    Question:
    Perform same example given in class question no 10 and check output using structure.
    """
        Create a swift class with some property.
        And then set its value using initializer of class, then perform below actions.
        let example1 = Example()
        example1.a = “Hello”
        let example2 = example1
        example2.a = “Hi”
        print(example1.a)
        print(example2.a) // Consider ‘a’ as string property of example class.
        --> Check these two print outputs and try to find out the reason for that output.
    """
    Try to find difference between these two outputs and try to figure out the reason for that output.
*/

struct Example {
    var a: String = "a"
}

// let example1 = Example()
// example1.a = "Hello" // --> as struct is declared constant, changing its property throws compile time error!
// let example2 = example1
// example2.a = "Hi"

var example1 = Example()
example1.a = "Hello"
var example2 = example1
example2.a = "Hi"

print(example1.a)
print(example2.a) // Consider ‘a’ as string property of example class.

/*
Answer:
As we have seen
Incase of classes
"""
Classes are reference types
so when we write `let example2 = example1`, it created a new variable example2 which also refer to same
object to which example1 refers to, so when we change value of a property of example2, it also affected
the example1 as both referring to same object in memory
Hence, example1.a and example2.a prints "Hi"
"""

But for structures they are value types, i.e. a new seperate copy is passed each time, so when we write
`var example2 = example1`, it create a new variable example2 which points to completely new and different
struct object (not same as example1). Hence modifying example2 value won't affect example1
Therefore, example1.a prints "Hello", whereas example2.a prints "Hi"
*/

/*
    Question:
    Try to figure out basic difference between class and structures and give a demo for same.
*/

/*
Answer:
As we have seen in previous example that one major difference between class and structs are that class
are reference types whereas structs are value types! - [demonstrated with example]
So here, we will see other differences between these two
*/

// #1, in class explicit implementation of init is must to initialize all stored properties!
// class SomeClass {
//     var uninitializedProperty: String // reason this class won't compile
//     var initializedProperty: Int = 9 // this will do
// }

struct SomeStruct {
    var uninitializedProperty: Int
    // this will compile and it provide a memberwise constructor to initialize all stored properties
}

// #2, we need to make struct method mutating to mutate it, we don't need it incase of class
// #3, we only mutate properties of structs with var, structs assigned with let are immutable
// #4, class props can change if they are defined with var

enum Direction {
    case north, east, south, west
}

class PointNorthClass {
    var direction: Direction = Direction.east // this can change its value
    func changeDirectionToNorth() {
        direction = Direction.north
    }
}

let pointNorthClass = PointNorthClass()
// pointNorthClass = PointNorthClass() // this will throw error as can't change the reference to class instance!
print("\nClass points:", pointNorthClass.direction)
pointNorthClass.changeDirectionToNorth()
print("Class points:", pointNorthClass.direction)

struct PointNorthStruct {
    var direction: Direction = Direction.east // this can change only if struct is assigned to var type!
    mutating func changeDirectionToNorth() {
        direction = Direction.north
    }
}

let immutatableStruct = PointNorthStruct()
// print("Trying to change direction of immutableStruct")
// immutatableStruct.changeDirectionToNorth() // this call will throw compile time error!

var pointNorthStruct = PointNorthStruct()
print("\nStruct points:", pointNorthStruct.direction)
pointNorthStruct.changeDirectionToNorth()
print("Struct points:", pointNorthStruct.direction)
