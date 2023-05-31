/*
 Name: Ankit Verma
 Topic: Optionals
 */

// Create an example of demonstrating How to declare optionals in swift?
var luckyNumber: Int?
var favBooks: [String]? = ["Think & Grow Rich", "Rich Dad, Poor Dad"]

// What is forced unwrapping in optionals show usage in example.
// Ans. optional variable can contain nil value, if we are certain that
//      the optional variable is not nil, we can use `!` operator to force wrap its
//      value for usage
if favBooks != nil {
    print(favBooks![0], terminator: "\n\n")
}

// Create one example of show usage of optional binding
// Ans. Optional Binding allows a better and safer way to work with optionals
//      We only perform operations on it if it is not nil, optional binding
//      checks for nil value and bind the optional value to temporary variable
//      if it is not nil
if let safeFavBooks = favBooks {
    print(safeFavBooks[1], terminator: "\n\n") //safe to call
}
//print(safeFavBooks[1]) // throws error as not in scope

// Create one example using if-let
// as luckyNumber contains nil value the if-let block is not executed
if let luckyNumber {
    print(luckyNumber, terminator: "\n\n")
}

// Create one example using guard-let
// Ans. guard statement helps us in early exit, in this case if user doesn't have any
//      favourite book then we can't print the favourite book list!
func printFavBooks(_ favBooks: [String]?) {
    guard let favBooks else {
        print("Oh! You don't read books\n")
        return
    }
    print("Your favourite books are:")
    for book in favBooks {
        print("-", book)
    }
}
printFavBooks(favBooks)
print()

// Create one example using nil colloison operator
// Ans. consider the case, we have to greet user,
//      if user is not logged in, we may not have his/her name
//      using nil coalescing operator, we can assign default value
var user: String?
print("Welcome \(user ?? "Guest")")
