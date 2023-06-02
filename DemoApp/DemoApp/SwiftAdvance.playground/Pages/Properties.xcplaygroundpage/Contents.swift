/*
    Name: Ankit Verma
    Topic: Properties
*/

class Stationary {
    init() {
        print("Stationary initialized")
    }
}

class Student {
    lazy var stationary = Stationary()
    
    init() {
        print("Student called!")
    }
}

let ankit = Student()

ankit.stationary

class StepCounter {
    var totalSteps = 0 {
        willSet {
            print("New value will be set \(newValue)")
        }
    }
}
var sc = StepCounter()
sc.totalSteps += 3

@propertyWrapper
struct FiveOrMore {
    private var value = 5
    var wrappedValue: Int {
        get {
            value
        }
        
        set {
            value = max(newValue, 5)
        }
    }
}

struct BigRect {
    @FiveOrMore var height: Int
    @FiveOrMore var width: Int
}

var rect = BigRect()
rect.height = 0
print(rect.height)
