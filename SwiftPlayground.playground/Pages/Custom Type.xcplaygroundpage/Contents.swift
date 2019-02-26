//: [Previous](@previous)

import Foundation

//Structures
struct Rectangle {
    var width = 12
    var height = 10
    var area: Int {
        return width * height
    }
}

var rectangleA = Rectangle()
var rectangleB = rectangleA  //it is a copy, because it is using a struct
rectangleA.height = 4
var rectangleC = Rectangle(width: 3, height: 5)

print(rectangleA)
print(rectangleB)
print(rectangleC)

print("Rectangle A area: \(rectangleA.area)")
print("Rectangle B area: \(rectangleB.area)")
print("Rectangle C area: \(rectangleC.area)")

//Generic types
struct NamedArray<Element> {
    var name: String
    var items: [Element]
}

let boardCards = NamedArray(name: "Board Games", items: ["Chess", "Go"])
print(boardCards)
let primes = NamedArray(name: "Primes", items: [1, 3, 5, 7, 13])
print(primes)


//Classes
class Fish {
    func swin() {
        print("I'm swimming.")
    }
}

class FlyingFish: Fish {
    func fly() {
        print("I'm flying.")
    }
}

let fish = FlyingFish()
fish.fly()
fish.swin()

//Overriding swin method
class ComplainingFish: Fish {
    override func swin() {
        print("Grumble grumble grumble...")
        super.swin()
    }
}

let fish2 = ComplainingFish()
fish2.swin()

//: [Next](@next)
