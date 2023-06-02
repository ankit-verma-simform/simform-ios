/*
    Name: Ankit Verma
    Topic: Enums, Struct, Class
*/

// MARK: - Enums

enum Color {
    case black
    case silver
    case white
    case red
}

enum Dir: String {
    case North = "north"
    case East = "east"
}

// no need to mention defaults, as switch is exhaustive!
func getTo(dir: Dir) {
    switch dir {
    case .East: ""
    case .North: ""
    }
}
let dir = Dir.East
let dirOptional = Dir(rawValue: "east") // returns optional type
getTo(dir: dir)
print(Dir.North.rawValue)

// faster way to write enums
// CaseIterable to iterate over all cases
enum TShirtSize: CaseIterable {
    case M, X, L, XL
}

for size in TShirtSize.allCases {
    print(size)
}

enum Response {
    case Success(data: String)
    case Error(message: String)
    case Loading
}
let resp = Response.Error(message: "Network Error occured!")
switch resp {
case .Loading: print("Show Loading Spinner")
case .Error(let message): print("Error: \(message)")
case .Success(let data): print("Do operation with data: \(data)")
}

enum Expr {
    case value(Int)
    indirect case add(Expr, Expr)
    indirect case sub(Expr, Expr)
}
let a = Expr.value(10)
let b = Expr.value(20)
let sum = Expr.add(a, b)

func evaluate(expr: Expr) -> Int {
    switch expr {
    case .value(let num):
        return num
    case let .add(left, right):
        return evaluate(expr: left) + evaluate(expr: right)
    case let .sub(left, right):
        return evaluate(expr: left) - evaluate(expr: right)
    }
}
print(evaluate(expr: sum))

// MARK: - Struct & Class

// structs are value types while class are ref types

struct iPhone {
    let version: String
    var color: String
    
    init() {
        version = "1.0.0"
        color = "white"
    }
}

class MacBook {
    let year: Int
    var color: String
    
    init(year: Int, color: String) {
        self.year = year
        self.color = color
    }
}

let myMacBook = MacBook(year: 2023, color: "White Grey")
let stolenMacBook = myMacBook
stolenMacBook.color = "Black"
print(myMacBook.color)

var myiPhone = iPhone()
myiPhone.color = "golden"
print(iPhone())

func changeColorOfMac(mac: MacBook) {
    mac.color = "no color"
}
changeColorOfMac(mac: myMacBook)
myMacBook.color

struct Bookstore {
    var owner = "Me"
    func sell() {
//        owner = "Someone" // will throw error since immutable
    }
    mutating func mutableSell() {
        owner = "Someone"
    }
}
