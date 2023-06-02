/*
 Name: Ankit Verma
 Topic: Error Handling Exercise
 */

/*
 Question 1:
 Create a password validation program. If length of password is
 less than 8 characters, it throws “Password too short” exception
 and if password is empty, throw “Empty password” exception.
 */

enum LoginError: Error {
    case emptyUsername
    case invalidUsername
    case invalidPasswordLength
    case emptyPassword
}

class UserLogin {
    func validatePassword(_ password: String) throws {
        if password.isEmpty {
            throw LoginError.emptyPassword
        }
        
        if password.count < 8 {
            throw LoginError.invalidPasswordLength
        }
    }

    func validateUsername(_ username: String) throws {
        if username.isEmpty {
            throw LoginError.emptyUsername
        }
        
        if username.count < 4 {
            throw LoginError.invalidUsername
        }
    }

    func login(username: String, password: String) {
        do {
            try validateUsername(username)
            try validatePassword(password)
            
            // performing login
            print("Login successful!")
        }
        catch LoginError.emptyUsername {
            print("Empty username")
        }
        catch LoginError.invalidUsername {
            print("Invalid username")
        }
        catch LoginError.emptyPassword {
            print("Empty password")
        }
        catch LoginError.invalidPasswordLength {
            print("Password too short")
        }
        catch {
            print("Something went wrong!")
        }
    }
}

UserLogin().login(username: "ankit.verma", password: "pass")
print()

/*
 Question 2:
 Create a program for shopping cart. If desired quantity for an item is not available,
 throw exception.
 */

struct Item {
    var price: Int
    var count: Int
}

enum ShopError: Error {
    case noSuchItemError
    case itemNotAvailable
    case insufficientAmount
}

class WatchShop {
    let inventory = [
        "Rainbow": Item(price: 700, count: 2),
        "Fast-Track": Item(price: 2000, count: 4),
        "TXC": Item(price: 1890, count: 3)
    ]
    
    func buy(itemName: String, count: Int, amount: Int) throws -> Int {
        guard let item = inventory[itemName] else {
            throw ShopError.noSuchItemError
        }
        
        if item.count < count {
            throw ShopError.itemNotAvailable
        }
        
        let totalCost = item.price * count
        if totalCost > amount {
            throw ShopError.insufficientAmount
        }
        
        print("Watch - \(itemName): x\(count) bought! ")
        return amount - totalCost
    }
}

let watchShop = WatchShop()
let shoppingCart = ["TXC" : 10, "Rainbow" : 1]
var wallet = 45000

print("=== Watch Shopping ===\n")
print("Cart:", shoppingCart)
print("Available Balance:", wallet)

for item in shoppingCart {
    do {
        wallet = try watchShop.buy(itemName: item.key, count: item.value, amount: wallet)
    }
    catch {
        print("Watch - \(item.key): \(error)")
    }
}
print("Balance remaining:", wallet)
