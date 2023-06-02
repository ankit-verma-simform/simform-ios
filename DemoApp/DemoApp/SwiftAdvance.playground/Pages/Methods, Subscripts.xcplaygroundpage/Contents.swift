/*
    Name: Ankit Verma
    Topic: Methods, Subscripts
*/

// MARK: - Methods

class Counter {
    static var count = 0
    
    class func increment() {
        count += 1
    }
    
    static func decrement() {
        count -= 1
    }
}

Counter.increment()
print(Counter.count)
Counter.decrement()
print(Counter.count)

class Decrement5LeapCounter : Counter {
    // can override since it is class func
    override class func increment() {
        // does nothing
    }
    
    // can't override because it is defined as static
//    override func decrement() {
//        count -= 5
//    }
    
    static func decrement5Leap(){
        count -= 5
    }
}

Decrement5LeapCounter.decrement5Leap()
print(Decrement5LeapCounter.count)

// MARK: - Subscripts

class MultiplicationTable {
    let number: Int
    
    init(of number: Int) {
        self.number = number
    }
    
    subscript(times: Int, n: Int) -> Int {
        number * times
    }
}
print("\nTable of 2:")
let tableOf2 = MultiplicationTable(of: 2)
for i in 1...10 {
    print("\(tableOf2.number) x \(i) = \(tableOf2[i,i])")
}
