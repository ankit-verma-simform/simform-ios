/*
 Name: Ankit Verma
 Topic: Dictionary
 Exercise:
 https://simformsolutionspvtltd-my.sharepoint.com/:w:/g/personal/ketan_c_simformsolutions_com/EdaI4nniQIpBsZtLXAU1xtIBYz9TIo4JoWI5Rnglq0aiQQ?e=avKLNa
 */

// 1)
let code = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a"
]
var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
var decode: [String : String] = [:]
for (k, v) in code {
    decode[v] = k
}
for char in encodedMessage {
    if let decodedChar = decode[String(char)] {
        print(decodedChar, terminator: "")
    } else {
        print(char, terminator: "")
    }
}
print("\n")

// 2)
var people: [[String : String]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton"
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie"
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera"
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno"
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen"
    ]
]
var firstNames: [String] = []
for person in people {
    if let personFirstName = person["firstName"] {
        firstNames.append(personFirstName)
    }
}
print(firstNames, terminator: "\n\n")

// 3)
//people is defined in #2)
var fullNames: [String] = []
for person in people {
    if let firstName = person["firstName"], let lastName = person["lastName"] {
        fullNames.append(firstName + " " + lastName)
    }
}
print(fullNames, terminator: "\n\n")

// 4)
var people2: [[String : Any]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 12
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
]

var personWithLowestScore: [String : Any] = people2.first ?? [:]
for person in people2 {
    guard let currentPersonScore = person["score"] as? Int,
          let lowestScore = personWithLowestScore["score"] as? Int,
          currentPersonScore < lowestScore else {
        continue
    }
    personWithLowestScore = person
}
if let firstName = personWithLowestScore["firstName"] as? String,
   let lastName = personWithLowestScore["lastName"] as? String {
    print(firstName + " " + lastName)
}
print()

// 5)
people2 = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 23
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
]

func compareScore(person1: [String : Any], person2: [String : Any]) -> Bool {
    guard let person1Score = person1["score"] as? Int,
          let person2Score = person2["score"] as? Int else {
        return false
    }
    return person1Score > person2Score
}

let people2SortedByScore =  people2.sorted(by: compareScore)
for (idx, person) in people2SortedByScore.enumerated() {
    guard let firstName = person["firstName"] as? String,
       let lastName = person["lastName"] as? String,
       let score = person["score"] as? Int else {
        break
    }
    print("\(idx + 1). \(firstName) \(lastName) - \(score)")
}
print()

// 6)
var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var numberFrequencyDict: [Int : Int] = [:]
for number in numbers {
    numberFrequencyDict[number] = (numberFrequencyDict[number] ?? 0) + 1
}
let sortedNumbersDict = numberFrequencyDict.sorted(by: {(pair1, pair2) -> Bool in
    return pair1.key < pair2.key
})
sortedNumbersDict.forEach({(num, freq) in print(num, freq)})
print()
