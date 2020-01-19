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



///
/// Property Wrappers
///

/*******************/
// wrappedValue
/*******************/

//@propertyWrapper
//struct Hoge<Value> {
//    var wrappedValue: Value
//}
//
//struct Foo {
//    @Hoge var foo: Int
//
//    // ... implemented as
//    // private var _foo: Hoge<Int>
//    // var foo: Int {
//    //     get { _foo.wrappedValue }
//    //     set { _foo.wrappedValue = newValue }
//    // }
//}
//
//let obj = Foo(foo: 10)
//// foo is equal to _foo.wrappedValue
//print(obj.foo) // 10


/*******************/
// projectedValue
/*******************/

//@propertyWrapper
//struct Hoge<Value> {
//    var wrappedValue: Value
//    var projectedValue: Self {
//        get { self }
//        set { self = newValue }
//    }
//}
//
//struct Foo {
//    @Hoge var foo: Int
//
//    // ... implemented as
//    // private var _foo: Hoge<Int>
//    // var foo: Int {
//    //     get { _foo.wrappedValue }
//    //     set { _foo.wrappedValue = newValue }
//    // }
//    // var $foo: Hoge<Int> {
//    //     get { _foo.projectedValue }
//    //     set { _foo.projectedValue = newValue }
//    // }
//}
//
//let obj = Foo(foo: 10)
//// $foo is equal to _foo.projectedValue
//print(obj.$foo) // Hoge<Int>(wrappedValue: 10)


/*************************/
// ex.) UserDefault
/*************************/

//@propertyWrapper
//struct UserDefault<T> {
//    let key: String
//    let defaultValue: T
//
//    var wrappedValue: T {
//        get {
//            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: key)
//        }
//    }
//}
//
//enum GlobalSettings {
//    @UserDefault(key: "isLaunch", defaultValue: false)
//    static var launched: Bool
//
//    @UserDefault(key: "launchDate", defaultValue: Date())
//    static var stateDate: Date
//}
//
//print(GlobalSettings.launched) // false
//print(GlobalSettings.stateDate) // 2020-01-19 13:46:44 +0000
//
//GlobalSettings.launched = true
//GlobalSettings.stateDate = Date().addingTimeInterval(60*60)
//
//print(GlobalSettings.launched) // true
//print(GlobalSettings.stateDate) // 2020-01-19 14:46:44 +0000


/*************************/
// ex.) Capitalized
/*************************/

//@propertyWrapper struct Capitalized {
//    var wrappedValue: String {
//        didSet { wrappedValue = wrappedValue.capitalized }
//    }
//
//    init(wrappedValue: String) {
//        self.wrappedValue = wrappedValue.capitalized
//    }
//}
//
//struct User {
//    @Capitalized var firstName: String
//    @Capitalized var lastName: String
//
//    var fullName: String { firstName + " " + lastName }
//}
//
//var user = User(firstName: "taro", lastName: "yamada")
//print(user.fullName) // Taro Yamada
//user.lastName = "suzuki"
//print(user.fullName) // Taro Suzuki
