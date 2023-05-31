/*
 Name: Ankit Verma
 Topic: Arrays
 Exercise:
 https://simformsolutionspvtltd-my.sharepoint.com/:w:/g/personal/ketan_c_simformsolutions_com/EZu37VQNeyZEloJqlEyMbMQBePdx09kWHAJ6F5HKvEvUMA?e=xpJUcd
 */

// 1)
var nums = [1, 2, 3, 1]
precondition(!nums.isEmpty, "Array must have atleast 1 integer element!")
print("First and last element of Array are equal:", nums.first == nums.last, terminator: "\n\n")

// 2)
nums = [1, 2, 3, 4]
precondition(!nums.isEmpty, "Array must have atleast 1 integer element!")
var result = [Int](repeating: 0, count: 2 * nums.count - 1)
result.append(nums.last ?? 0)
print(result, terminator: "\n\n")

// 3)
nums = [0, 1, 2, 3]
precondition(!nums.isEmpty, "Array must have atleast 1 integer element!")
result = [Int](nums.prefix(2))
print(result, terminator: "\n\n")

// 4)
nums = [0, 50, 100, 20, 80, 150]
precondition(!nums.isEmpty, "Array must have atleast 1 integer element!")
print(nums.max() ?? "No maximum", terminator: "\n\n")

// 5)
nums = [0, 5, 6, 2, 10]
result = nums.reversed()
print(result, terminator: "\n\n")

// 6)
var listOfNumbers = [1, 2, 3, 10, 100]
var divisors = [2, 5]
prac6Loop: for number in listOfNumbers {
    for divisor in divisors {
        if number % divisor == 0 {
            print(number, terminator: ", ")
            continue prac6Loop
        }
    }
}
print("\n")

// 7)
nums = [8, 7, 1, 2, 3, 4, 5]
print(nums.first ?? "Array has no first element!")
print(nums.last ?? "Array has no last element!")
print(nums.lastIndex(of: 2) ?? "No such element!")
print(nums.contains(4))
print(nums.count)
nums.append(6)
print(nums)
print(nums.remove(at: 0))
print(nums.distance(from: 1, to: 6))
print(nums.remove(at: 0))
