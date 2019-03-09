// Parsing JSON data

// References:
// https://developer.apple.com/swift/blog/?id=37
// https://medium.com/@nimjea/json-parsing-in-swift-2498099b78f

import Foundation

let json: [String : Any] = [
  "name": "Caffè Macs",
  "coordinates": [
    "lat": 37.330576,
    "lng": -122.029739
  ],
  "meals": ["breakfast", "lunch", "dinner"]
]

print(json)

if JSONSerialization.isValidJSONObject(json) {
  if let data = try? JSONSerialization.data(withJSONObject: json, options: []) {
    print("JSON data object is: \(data)")
  }
}
