/*
    Name: Ankit Verma
    Topic: Inheritance
*/

// MARK: - Inheritence

//class Vehicle {
//    var wheels: Int
//    init() {
//        // will throw error as init doesn't initialize all stored properties
//    }
//}
//
//Vehicle()

class Shape {
    func draw() {
        print("Draw shape ...")
    }
}

class Rectangle : Shape {
    var length, width: Int

    init(length: Int, width: Int) {
        self.length = length
        self.width = width
    }
    
    override func draw() {
        print("Draw rectangle ...")
    }
}

final class Square : Rectangle {

    init(length: Int) {
        super.init(length: length, width: length)
    }
}

//class SmallSquare : Square {
//    // will give error as can't inherit from final class
//}

// MARK: - Memberwise initialization

struct Size {
    var height = 0.0, width = 0.0
}
var s1 = Size(width: 5.9)
var s2 = Size(height: 2.2)
var s3 = Size()
var s4 = Size(height: 2.2, width: 5.4)
print(s1)
print(s2)
print(s3)
print(s4)

// MARK: - Failable initializers

struct Color {
    var value: String
    
    init?(value: String) {
        if value.isEmpty {
            return nil
        }
        self.value = value
    }
}

let color = Color(value: "")

// MARK: - Required initializer

class Artist {
    var type: String
    
    required init(type: String = "Local Artist") {
        self.type = type
    }
}

class DigitalArtist : Artist {
    
}

class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}

class SomeSubclass: SomeClass {
//    required init() {
//        // subclass implementation of the required initializer goes here
//    }
}
