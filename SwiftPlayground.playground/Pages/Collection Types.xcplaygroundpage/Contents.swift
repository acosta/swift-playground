// Collection Types

// Reference: https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html

// Array: ordered collection of values
// Set: unordered collection of unique values
// Dicitionary: unordered collections of key-value associations

// Array
var someInts = [Int]()
print("someInts size: \(someInts.count)")
someInts.append(5)
print("someInts size: \(someInts.count)")
someInts = []
print("someInts size: \(someInts.count)")

var threeDoubles = Array(repeating: 0.0, count: 3)
print("threeDoubles size: \(threeDoubles.count)")
print(threeDoubles)

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

let arrayDouble: [Double] = [5.4, 0.3, 9.6, 2.7]
print(arrayDouble + sixDoubles)

var arrayDouble2 = [5.4, 0.3, 9.6, 2.7]
print(arrayDouble2 + sixDoubles)

var shoppingList: [Any] = ["Milk", "Eggs", 2]
print(shoppingList)

someInts.isEmpty ? print("array is empty") : print("array is not empty")
someInts.append(7)
someInts.isEmpty ? print("array is empty") : print("array is not empty")
someInts += [7]
someInts += [12]
someInts += [-78]
print(someInts)

// change existing value
someInts[1] = -2
print(someInts)

// change a range of values
someInts[1...3] = [-1, 10, 25, 67, -33]
print(someInts)

// insert a value in a specific position
someInts.insert(0, at: 0)
print(someInts)
someInts.insert(100, at: 5)
print(someInts)

// remove a value from a specific position
print(someInts.remove(at: 5))
print(someInts)

print(someInts.removeLast())
print(someInts)

for value in someInts {
    print(value)
}

for (index, value) in someInts.enumerated() {
    print("Item \(index + 1): \(value)")
}

// Sets
var letters = Set<Character>()
print("Letters set size: \(letters.count)")

letters.insert("9")
letters.insert("Ç")
print(letters)

var favoriteGenres: Set = ["Rock", "Classical", "Pop"]
print(favoriteGenres)

favoriteGenres.insert("Jazz")
favoriteGenres.insert("Samba")
print(favoriteGenres.insert("Samba").inserted) // prints false due Samba is already in the Set
print(favoriteGenres)

var genre = (favoriteGenres.remove("Pop"))!
print(genre)

// removing a non member in a guard way
if let genre2 = favoriteGenres.remove("Jazz") {
    print("\(genre2) was removed!")
} else {
    print("nothing removed")
}

print(favoriteGenres)

favoriteGenres.contains("Funk") ? print("review your genre") : print("not so bad")

print(favoriteGenres.sorted())
print(favoriteGenres)

for genre in favoriteGenres {
    print(genre)
}

// Fundamental Set Operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits))
print(oddDigits.union(evenDigits).sorted())

print(oddDigits.intersection(evenDigits))

print(oddDigits.subtracting(singleDigitPrimeNumbers))

print(oddDigits.symmetricDifference(singleDigitPrimeNumbers))

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print(houseAnimals.isSubset(of: farmAnimals))

print(farmAnimals.isSuperset(of: houseAnimals))

print(farmAnimals.isDisjoint(with: cityAnimals))

// Dictionaries

var namesOfIntegers = [Int: String]()
print(namesOfIntegers.count)

namesOfIntegers[1] = "one"
print(namesOfIntegers.count)
print(namesOfIntegers)

namesOfIntegers[6] = "six"
namesOfIntegers[20] = "twenty"
print(namesOfIntegers)

namesOfIntegers = [:]
print(namesOfIntegers.count)

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airports)

airports["LHR"] = "London"
print(airports)
airports["LHR"] = "London Heathrow"
print(airports)

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

if let airportName = airports["BRA"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"
print(airports)

airports["APL"] = nil
print(airports)

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

if let removedValue = airports.removeValue(forKey: "BRA") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for BRA.")
}

print(airports)
for (airportCode, airportName) in airports {
    print("\(airportCode) : \(airportName)")
}

for airportName in airports.values {
    print(airportName)
}

let airportCodes = [String](airports.keys)
print(airportCodes)

let airportNames = [String](airports.values)
print(airportNames)

for airportCodes in airportCodes.sorted() {
    print(airportCodes)
}
