//: [Previous](@previous)

import Foundation

func sayHello(name: String, upperCase: Bool) {
    if upperCase {
        print("Hello, \(name.uppercased())!")
    } else {
        print("Hello, \(name)!")
    }
}

sayHello(name: "Afonso", upperCase: true)
sayHello(name: "Laura", upperCase: false)
sayHello(name: "Luciana", upperCase: true)

//Omitting Argument Labels
func sayHello2(_ name: String, _ upperCase: Bool) {
    if upperCase {
        print("Hello, \(name.uppercased())!")
    } else {
        print("Hello, \(name)!")
    }
}

sayHello2("Afonso", true)
sayHello2("Laura", false)
sayHello2("Luciana", true)

//Parameters with default values
func sayHello3(_ name: String, _ upperCase: Bool = false) {
    if upperCase {
        print("Hello, \(name.uppercased())!")
    } else {
        print("Hello, \(name)!")
    }
}

sayHello3("Afonso", true)
sayHello3("Laura")
sayHello3("Luciana", true)

//Returning Optional values
func firstString(hasPrefix prefix: String, in strings: [String]) -> String? {
    for string in strings {
        if string.hasPrefix(prefix) {
            return string
        }
    }
    return nil
}

let guests = ["Afonso", "Laura", "Luciana"]
if let guest = firstString(hasPrefix: "L", in: guests) {
    print("See you there, \(guest)")
} else {
    print("You are not invited")
}

//Function as arguments
func filterInts(_ numbers: [Int], _ includeNumber: (Int) -> Bool) -> [Int] {
    var result: [Int] = []
    
    for number in numbers {
        if includeNumber(number) {
            result.append(number)
        }
    }
    
    return result
}

let numbers = [12, 67, 32, 17, 11, 2, -8, 44, 18]
func divisibleByTwo(_ number: Int) -> Bool {
    return number % 2 == 0
}

let evenNumbers = filterInts(numbers, divisibleByTwo)
print("Even numbers: \(evenNumbers)")

//Closure expressions
let evenNumbers2 = filterInts(numbers, { (number: Int) -> Bool in return number % 2 == 0 })
print("Even numbers 2: \(evenNumbers2)")

//Trailing closures
let evenNumbers3 = filterInts(numbers) { $0 % 2 == 0 }
print("Even numbers 3: \(evenNumbers3)")

let evenNumbers4 = filterInts(numbers) { number in return number % 2 == 0 }
print("Even numbers 4: \(evenNumbers4)")

//Filter and Map methods
let names = ["Afonso", "Luciana", "Laura", "Rosa"]

let shortNames = names.filter { name in name.characters.count <= 5}
                      .map { name in name.uppercased()}
print(shortNames)
//: [Next](@next)
