/*
 Name: Ankit Verma
 Topic: Control Flow
 Exercise:
 https://simformsolutionspvtltd-my.sharepoint.com/:w:/g/personal/ketan_c_simformsolutions_com/EWOjEC-jcyZNpEM88-IJceQBaBg6J6xHGdp4hoPfRPH-1w?e=h0GkK5
 */

import Foundation

// 1)
var N = 100
var result = 2
while result <= N {
    print(result)
    result *= 2
}
print()

// 2)
N = 3
for _ in 1...N {
    for _ in 1...N {
        print("*", terminator: "")
    }
    print()
}
print()

// 3)
N = 4
for i in 1...N {
    for _ in 1...i {
        print("*", terminator: "")
    }
    print()
}
print()

// 4)
N = 4
for i in 1...N {
    if i != N {
        for _ in 1...(N-i) {
            print(" ", terminator: "")
        }
    }
    for _ in 1...(2*i-1) {
        print("*", terminator: "")
    }
    print()
}
print()

// 5)
let number = 17
let sqrtNumber = Int(sqrt(Double(number)))
if number < 2 {
    print("Not Prime")
}
else {
    var isPrime = true
    for i in stride(from: 2, to: sqrtNumber, by: 1) {
        if number % i == 0 {
            print("Not Prime")
            isPrime = false
            break
        }
    }
    if isPrime {
        print("Prime")
    }
}
