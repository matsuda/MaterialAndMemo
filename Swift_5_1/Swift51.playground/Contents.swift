import UIKit

///
/// enum with Associated Values
///

enum Barcode {
    case upc(a: Int = 1, Int, Int, Int)
    case qrCode(String)
}

let productBarcode = Barcode.upc(85909, 51226, 3)
print(productBarcode) // upc(a: 1, 85909, 51226, 3)


///
/// Synthesize default values for the memberwise initializer
///

struct Dog {
    var age: Int = 0
    var name: String

//    init(age: Int = 0, name: String) {
//        self.age = age
//        self.name = name
//    }
}

let dogInSwift5_0 = Dog(age: 3, name: "Sparky")
print(dogInSwift5_0) // Dog(age: 3, name: "Sparky")
let dogInSwift5_1 = Dog(name: "Sparky")
print(dogInSwift5_1) // Dog(age: 0, name: "Sparky")

///
/// Implicit returns from single-expression functions
///

func sum(_ a: Int, _ b: Int) -> Int {
    a + b
}

let total = sum(5, 8)
print(total) // 13


///
/// Expanding Swift Self to class members and value types
///
extension Numeric {
    func incremented(by value: Self = 1) -> Self {
        return self + value
    }
}

class NetworkManager {
    class var maximumActiveRequests: Int {
        return 4
    }

    func printDebugData() {
//        print("Maximum network requests: \(NetworkManager.maximumActiveRequests).")
        print("Maximum network requests: \(type(of: self).maximumActiveRequests).")
    }
}

class ThrottledNetworkManager: NetworkManager {
    override class var maximumActiveRequests: Int {
        return 1
    }
}

let manager = ThrottledNetworkManager()
manager.printDebugData() // Maximum network requests: 1.

///
/// Warnings for ambiguous none cases
///

enum Theme {
    case none
    case light
    case dark
}

let theme1: Theme? = .none
print(theme1)


///
/// Matching optional enums against non-optionals
///

enum BuildStatus {
    case starting
    case inProgress
    case complete
}

let status: BuildStatus? = .inProgress

switch status {
case .inProgress:
    print("Build is starting…")
case .complete:
    print("Build is complete!")
default:
    print("Some other build status")
}



