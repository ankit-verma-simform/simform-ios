/*
 Name: Ankit Verma
 Topic: Optional Chaining
 */

class Dictionary {
    private var dict: [String : String]
    
    init?(_ dict: [String : String] = [:]) {
        for (word, defn) in dict {
            if word.isEmpty || defn.isEmpty {
                return nil
            }
        }
        self.dict = dict
    }
    
    init() {
        self.dict = [:]
    }
    
    subscript(word: String) -> String? {
        set(definition) {
            guard let definition else {
                dict[word] = nil
                return
            }
            
            if !definition.isEmpty {
                dict[word] = definition
            }
        }
        
        get {
            dict[word]
        }
    }
    
    func getRandomWord() -> (word: String, definition: String)? {
        guard let (word, definition) = dict.randomElement() else {
            return nil
        }
        
        return (word, definition)
    }
}

var myOptionalDict = Dictionary([
    "mango": "a summer season tropical fruit",
    "google": "a common term refering to search on the internet",
    "yahoo": "an expression of excitment"
])

// using optional chaining to add words
myOptionalDict?["apple"] = "a red fruit"
myOptionalDict?["king"] = "ruler of a kingdom"

// accessing definition and making it uppercase!
var definitionOfKing = myOptionalDict?["king"]?.uppercased() ?? "NOT FOUND!"
print("Defition of \"King\": \(definitionOfKing)")

// getting random word
if let randomWord = myOptionalDict?.getRandomWord() {
    print("Today's random word is ... \(randomWord.word)")
    print("which means ... \(randomWord.definition)")
}
