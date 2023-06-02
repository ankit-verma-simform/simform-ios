/*
    Name: Ankit Verma
    Topic: ARC
*/

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        print("Person \(name) created!")
        self.name = name
    }
    deinit {
        print("Person \(name) destroyed!")
    }
}

// unassigned instance deallocated when the use is over!
Person(name: "Someone")

// weak var instance is deallocated as soon as the use is over!
weak var jim = Person(name: "Jim")

// instance is not deallocated as long as there is atleast 1 reference to it!
var littleStrongPerson: Person? = Person(name: "BigFoot")
var bigFoot = littleStrongPerson
littleStrongPerson = nil
bigFoot = nil

class Apartment {
    let name: String
    var tenant: Person?
    
    init(name: String) {
        print("Apartment \(name) created!")
        self.name = name
    }
    deinit {
        print("Apartment \(name) destroyed!")
    }
}

// strong references cycle - 2 class instance hold strong reference to each other
// leads to strong references cycle! possible memory leak

var ram: Person? = Person(name: "Ram")
var govindSociety: Apartment? = Apartment(name: "Govind Society")
ram?.apartment = govindSociety
govindSociety?.tenant = ram
ram = nil
govindSociety = nil

// still the instances are not deallocated as they hold strong reference to each other!

// #2 ways to resolve strong reference cycles
// - use weak var when other instance has shorter lifetime
// - use unowned var when other instance has same or longer lifetime


class SafePerson {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        print("Person \(name) created!")
        self.name = name
    }
    deinit {
        print("Person \(name) destroyed!")
    }
}

class SafeApartment {
    let name: String
    weak var tenant: Person?
    
    init(name: String) {
        print("Apartment \(name) created!")
        self.name = name
    }
    deinit {
        print("Apartment \(name) destroyed!")
    }
}

class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
print(heading.asHTML())

// opaque types
// using some keyword allows compile to preserve type identifier
// at compiler level so it knows what its associatedtype

class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
    deinit {
        print("department \(name) deleted!")
    }
}

class Course {
    var name: String
    var department: Department
    var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
    deinit {
        print("course \(name) deleted!")
    }
}

var department: Department? = Department(name: "Horticulture")
let intro = Course(name: "Survey of Plants", in: department!)
let intermediate = Course(name: "Growing Common Herbs", in: department!)
let advanced = Course(name: "Caring for Tropical Plants", in: department!)

intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department?.courses = [intro, intermediate, advanced]
department = nil
