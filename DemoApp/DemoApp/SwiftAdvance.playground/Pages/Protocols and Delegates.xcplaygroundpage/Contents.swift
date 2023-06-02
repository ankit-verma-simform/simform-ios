/*
 Name: Ankit Verma
 Topic: Protocols and Delegates
 */

protocol FullyNamed {
    var fullName: String { get }
}

struct Person : FullyNamed {
    var fullName: String
}

var person = Person(fullName: "Ankit Verma")
person.fullName = "Verma Ankit"

// MARK: - protocol inheritance

protocol Engine {
    func startEngine()
    func stopEngine()
}

protocol Safety {
    func applyEmergencyBreaks()
    func releaseAirBags()
    func handBreak()
}

protocol SpeedControl {
    func increaseSpeed()
    func decreaseSpeed()
}

protocol Vehicle: Engine, Safety, SpeedControl {
    var speed: Int { get set }
    var wheels: Int { get set }
    var fuelTank: Int { get set }
}

class Car : Vehicle {
    var speed: Int = 0
    var wheels: Int = 0
    var fuelTank: Int = 0
    
    func startEngine() {
        print("engine started")
    }
    
    func stopEngine() {
        print("engine stopped")
    }
    
    func applyEmergencyBreaks() {
        print("applied emergency breaks")
    }
    
    func releaseAirBags() {
        print("released air bags")
    }
    
    func handBreak() {
        print("pulled hand break")
    }
    
    func increaseSpeed() {
        print("speed increased")
        speed += 1
    }
    
    func decreaseSpeed() {
        print("speed decreased")
        speed -= 1
    }
}

// MARK: - Adding mutating requirements with protocols

protocol Togglable {
    mutating func toggle()
}

enum SwitchButton : Togglable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .off: self = .on
        case .on: self = .off
        }
    }
}

var switchButton = SwitchButton.on
switchButton.toggle()
print(switchButton)

class FanSwitch : Togglable {
    enum Switch {
        case on, off
    }
    var state: Switch = .on
    
    func toggle() {
        switch state {
        case .on: state = .off
        case .off: state = .on
        }
    }
}

var fanSwitch = FanSwitch()

protocol Printable {
    var print: String { get }
}

extension Array : Printable {
    var print: String {
        """
        This array contains \(count) elements!
        \(self)
        """
    }
}
 
[0].print

protocol ClassOnlyProtocol: AnyObject {
    func getSectret()
}

class CustomClass: ClassOnlyProtocol {
    func getSectret() {
        print("Secret only known to classes")
    }
}

//struct CustomStructure: ClassOnlyProtocol {
//    // won't compile - can't conform to class only protocol
//}

/*
 Converting given abstract class example to swift code using
 protocols - extension
 
 //Java Code
 
 abstract class GraphicObject {
     int x, y;
     ...
     void moveTo(int newX, int newY) {
         ...
     }
     abstract void draw();
     abstract void resize();
 }
 
 class Circle extends GraphicObject {
     void draw() {
         ...
     }
     void resize() {
         ...
     }
 }
 class Rectangle extends GraphicObject {
     void draw() {
         ...
     }
     void resize() {
         ...
     }
 }
 */

protocol GraphicObject {
    var x: Int { get set }
    var y: Int { get set }
    func draw()
    func resize()
}

extension GraphicObject {
    mutating func moveTo(newX: Int, newY: Int) {
        x = newX
        y = newY
    }
}

class Circle : GraphicObject {
    var x: Int
    var y: Int
    var radius: Int
    
    init?(x: Int, y: Int, radius: Int) {
        guard radius > 0 else {
            return nil
        }
        
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    func draw() {
        print("Drawing circle with center (\(x),\(y)) and radius \(radius)")
    }
    
    func resize() {
        print("Resizing circle")
    }
}

var circle = Circle(x: 0, y: 0, radius: 5)
circle?.draw()
circle?.moveTo(newX: 5, newY: 5)
circle?.draw()

struct Rectangle : GraphicObject {
    var x: Int
    var y: Int
    var height: Int
    var weight: Int
    
    init?(x: Int, y: Int, height: Int, weight: Int) {
        guard weight > 0, height > 0 else {
            return nil
        }
        
        self.x = x
        self.y = y
        self.height = height
        self.weight = weight
    }
    
    func draw() {
        print("Drawing rectangle with center (\(x),\(y)) [\(height)x\(weight)]")
    }
    
    func resize() {
        print("Resizing rectangle")
    }
}

var rect = Rectangle(x: 14, y: 7, height: 6, weight: 8)
rect?.draw()
rect?.moveTo(newX: 76, newY: 9)
rect?.draw()

// MARK: - init requirement and required keyword

protocol SomeProtocol {
    init(someInt: Int)
}

class SomeClass: SomeProtocol {
    required init(someInt: Int) {}
}

// MARK: - Delegation

protocol Worker: AnyObject { //rules to be followed by subtype
    func doWork()
}

class Boss {
    weak var delegate: Worker?
    
    func giveTaskToEmployee() { //delegate work to other class
        delegate?.doWork()
    }
}

class Employee: Worker {
    func doWork() { // knows how to do work
        print("Does work ...")
    }
}

var boss = Boss()
let employee = Employee()
boss.delegate = employee
boss.giveTaskToEmployee()

// MARK: - Strong and Weak references

//struct Student {
//    var name: String
//    var classmate: Student? // won't compile structs can't have stored property which recursively contains it
//}

// MARK: - Strong reference example
class Student {
    var name: String
    var classmate: Student?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("deallocating \(self.name) student!")
    }
}

var sam: Student? = Student(name: "Sam") //sam++ -> 1
var max: Student? = Student(name: "Max") //max++ -> 1
sam?.classmate = max //max++ -> 2
max?.classmate = sam //sam++ -> 2
sam = nil //sam-- -> 1
max = nil //max-- -> 1

// as reference is not 0, memory is not deallocated!

// MARK: - Weak reference example
class ChessPlayer {
    var name: String
    var rating: Double
    weak var opponent: ChessPlayer?
    
    init(name: String, rating: Double) {
        self.name = name
        self.rating = rating
    }
    
    deinit {
        print("deallocating \(self.name) chess player!")
    }
}

var ankit: ChessPlayer? = ChessPlayer(name: "Ankit", rating: 1200) //ankit++ -> 1
var jap: ChessPlayer? = ChessPlayer(name: "Jap", rating: 1700) //jap++ -> 1
ankit?.opponent = jap //jap -> 1
jap?.opponent = ankit //ankit -> 1
ankit = nil //ankit-- -> 0
jap = nil //jap-- -> 0
