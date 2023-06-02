/*
    Name: Ankit Verma
    Topic: Error Handling
*/

enum CalcError: Error {
    case divisionByZeroError
    case invalidOperationError
}

do {
    throw CalcError.divisionByZeroError
}
catch CalcError.divisionByZeroError {
    print("You cannot divide by 0!")
    do {
        throw CalcError.divisionByZeroError
    } catch {
        print("Nested try - catch")
    }
}
catch {
    print("Random Error!")
}

func performDivision(num1: Int, num2: Int) throws -> Int {
    if num2 == 0 {
        throw CalcError.invalidOperationError
    }
    return num1 / num2
}
