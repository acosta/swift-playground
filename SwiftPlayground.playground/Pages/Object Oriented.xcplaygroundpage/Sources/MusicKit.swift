// Base classes

// It is going to be visible by all outsiders but you cannot subclass it
final public class Music {
    public let notes: [String]

    public init(notes: [String]) {
        self.notes = notes
    }

    public func prepared() -> String {
        return notes.joined(separator: " ")
    }
}

// Mark it as open just to allow subclassing
open class Instrument {
    public let brand: String

    public init(brand: String) {
        self.brand = brand
    }

    // It is an abstract method and it cannot be called directly
    // it is marked as open to allow overriding
    open func tune() -> String {
        fatalError("Implement this method for \(brand)")
    }

    open func play(_ music: Music) -> String {
        return music.prepared()
    }

    // it is marked as final so no one can override it
    final public func perform(_ music: Music) {
        print(tune())
        print(play(music))
    }
}
