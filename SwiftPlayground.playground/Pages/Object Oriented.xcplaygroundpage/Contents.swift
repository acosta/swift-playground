//: [Previous](@previous)

// Classes for modeling Musical instruments

class Music {
    let notes: [String]

    init(notes: [String]) {
        self.notes = notes
    }

    func prepared() -> String {
        return notes.joined(separator: " ")
    }
}


class Instrument {
    let brand: String

    init(brand: String) {
        self.brand = brand
    }

    // It is an abstract method and it can not be called directly
    func tune() -> String {
        fatalError("Implement this method for \(brand)")
    }

    func play(_ music: Music) -> String {
        return music.prepared()
    }

    func perform(_ music: Music) {
        print(tune())
        print(play(music))
    }
}

class Piano: Instrument {
    let hasPedals: Bool
    static let whiteKeys = 52
    static let blackKeys = 36

    init(brand: String, hasPedals: Bool = false) {
        self.hasPedals = hasPedals
        super.init(brand: brand)
    }

    override func tune() -> String {
        return "Piano standard tunning for \(brand)."
    }

    override func play(_ music: Music) -> String {
        return play(music, usingPedals: hasPedals)
    }

    func play(_ music: Music, usingPedals: Bool) -> String {
        let preparedNotes = super.play(music)
        if hasPedals && usingPedals {
            return "Play piano notes \"\(preparedNotes)\" with pedals."
        } else {
            return "Play piano notes \(preparedNotes) without pedals."
        }
    }
}

let music = Music(notes: ["do", "re", "mi", "fa", "sol", "da", "fa"])
let piano = Piano(brand: "testePiano")
print(piano.tune())
print("Piano whiteKeys: \(Piano.whiteKeys)")
print(piano.play(music))
print(piano.play(music, usingPedals: true))
Piano.blackKeys

// Intermediate abstract base class
// It only adds a new string value to the Instrument base class
class Guitar: Instrument {
    let stringGauge: String

    init(brand: String, stringGauge: String = "medium") {
        self.stringGauge = stringGauge
        super.init(brand: brand)
    }
}

// It is possible to create instance of a abstract class but it is limited
// For example, it is not possible to call guitar.tone()
let guitar = Guitar(brand: "Yamaha")
print(guitar.play(music))
//guitar.tune()  // fatal error here!!!

// Concrete guitars
class AcousticGuitar: Guitar {
    static let numberOfStrings = 6
    static let fretCount = 20

    override func tune() -> String {
        return "Tune \(brand) acoustic with E A D G B E"
    }

    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play folk tune on frets \(preparedNotes)."
    }
}

let rolandBrand = AcousticGuitar(brand: "Roland", stringGauge: "light")
print(rolandBrand.tune())
print(rolandBrand.play(music))

class Amplifier {
    // private stored property. It is a convention to put an undescore at the
    //beginning
    private var _volume: Int
    // stored property below can be read by outside but not written
    private(set) var isOn: Bool

    init() {
        isOn = false
        _volume = 0
    }

    func plugIn() {
        isOn = true
    }

    func unplug() {
        isOn = false
    }

    // computed property wraps the private stored property
    var volume: Int {
        // getter drops the volume to 0 if it's not plugged in
        get {
            return isOn ? _volume : 0
        }
        // the volume will always be clamped to a certain value between 0 and 10
        set {
            _volume = min(max(newValue, 0), 10)
        }
    }
}

class EletricGuitar: Guitar {
    let amplifier: Amplifier

    init(brand: String, stringGauge: String = "light", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }

    override func tune() -> String {
        amplifier.plugIn()
        amplifier.volume = 5
        return "Tune \(brand) eletric with E A D G D E"
    }

    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play solo \(preparedNotes) at volume \(amplifier.volume)"
    }
}

class BassGuitar: Guitar {
    let amplifier: Amplifier

    init(brand: String, stringGauge: String = "heavy", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }

    override func tune() -> String {
        amplifier.plugIn()
        return "Tune \(brand) bass with E A D G"
    }

    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play bass line \(preparedNotes) at volume \(amplifier.volume)"
    }
}

// Reference semantics
// if the value is changed by one class, the amplifier will be changed in other class as well
// once it is the same reference for both classes
let amplifier = Amplifier()

let electricGuitar = EletricGuitar(brand: "Eletric", amplifier: amplifier)
let bassGuitar = BassGuitar(brand: "Bass", amplifier: amplifier)

print(electricGuitar.tune())
print(bassGuitar.amplifier.volume)
print(bassGuitar.tune())
print(electricGuitar.amplifier.volume)
bassGuitar.amplifier.unplug()
print(bassGuitar.amplifier.volume)

class Band {
    let instruments: [Instrument]

    init(instruments: [Instrument]) {
        self.instruments = instruments
    }

    func perform(_ music: Music) {
        for instrument in instruments {
            instrument.perform(music)
        }
    }
}

let instruments = [piano, rolandBrand, electricGuitar, bassGuitar]
let band = Band(instruments: instruments)
band.perform(music)
//: [Next](@next)
