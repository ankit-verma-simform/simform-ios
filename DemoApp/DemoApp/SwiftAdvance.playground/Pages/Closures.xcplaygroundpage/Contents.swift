/*
    Name: Ankit Verma
    Topic: Closures
*/

struct Student {
    let name: String
    var testScore: Int
}

let students = [
    Student(name: "Luke", testScore: 88),
    Student(name: "Han", testScore: 73),
    Student(name: "Chewy", testScore: 95),
    Student(name: "Obi-Wan", testScore: 78),
    Student(name: "Ahsoka", testScore: 86),
    Student(name: "Yoda", testScore: 68),
]

// Ref: https://www.youtube.com/watch?v=ND44vQ5iJyc

// closure is a function expression that can be passed to another function
// and can be assigned to variable
var topStudentsFilter: (Student) -> Bool = { student in
    return student.testScore > 80
}

// normal function
func topStudentFilterFunc(student: Student) -> Bool {
    return student.testScore > 80
}

// using closures and passing functions to functions
let topStudents = students.filter(topStudentFilterFunc)
print("\nTopStudents:")
topStudents.forEach({student in print(student.name)})

// using short hand for closures $0, $1, ...
let averageStudents = students.filter { $0.testScore < 70 }
let leaderBoard = topStudents.sorted { $0.testScore > $1.testScore }
print("\nLeaderboard:")
leaderBoard.forEach { print($0.name) }

// quicknote: closures in swift are somewhat similar to lambda functions in kotlin

//let someClosure: (Int) -> () = { param1 in
//    param1 = 5 // will throw error bcuz param1 is constant
//}

//let alwaysNil: Int? = nil
//alwaysNil = 9 // will throw error

// nested functions - capturing concept closure
func outerFunc(times: Int) -> ((Int) -> Int) {
    let multiplier = 100
    let closure: (Int) -> Int = { num in
        return multiplier * num * times
    }
    return closure
}
print(outerFunc(times: 3)(5))

// closure captures scope variables and constants with default strong reference
// that may lead to strong reference cycle and memory leaks
// fix: use of capture list [weak | unowned <varname>]
// weak - reference can become nil at some point
// unowned - won't become nil, but will be removed at some point

// autoclosure
struct Company {
    let name: String
    var description: String {
        return "Company is \(name)"
    }
}

let debug = true
func logMessage(_ message: @autoclosure () -> String) {
    if debug {
        print("debug: \(message())")
    }
}
let simform = Company(name: "Simform")
logMessage(simform.description)
