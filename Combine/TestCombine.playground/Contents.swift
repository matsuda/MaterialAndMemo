import UIKit
import Combine

/*
let receiveCompletion: (Subscribers.Completion<Error>) -> Void = { completion in
    switch completion {
    case .finished: print("finished")
    case .failure(let error): print("error:", error)
    }
}

let receiveValue: (String) -> Void = { value in
    print("receiveValue:", value)
}
 */

let testError = NSError(domain: "NSError", code: -100)

do {
    print("Publisher : Future")
    let publisher: Future<String, Error> = .init { (promise) in
        promise(.success("success"))
        // result(.failure(testError))
    }
    let _ = publisher.sink(receiveCompletion: { (completion) in
        switch completion {
        case .finished: print("finished")
        case .failure(let error): print("error:", error)
        }
    }, receiveValue: { value in
        print("receiveValue:", value)
    })
}

print("")

do {
    print("Publisher : Just")
    let publisher: Just<String> = .init("just")
    let _ = publisher.sink(receiveCompletion: { (completion) in
        switch completion {
        case .finished: print("finished")
        case .failure(let error): print("error:", error)
        }
    }, receiveValue: { value in
        print("receiveValue:", value)
    })
}

print("")

do {
    print("Publisher : Empty")
    let publisher: Empty<String, Error> = .init()
    // let publisher: Empty<String, Error> = .init(completeImmediately: false)
    let _ = publisher.sink(receiveCompletion: { (completion) in
        switch completion {
        case .finished: print("finished")
        case .failure(let error): print("error:", error)
        }
    }, receiveValue: { value in
        print("receiveValue:", value)
    })
}

print("")

do {
    print("Publisher : Fail")
    let publisher: Fail<String, Error> = .init(error: testError)
    let _ = publisher.sink(receiveCompletion: { (completion) in
        switch completion {
        case .finished: print("finished")
        case .failure(let error): print("error:", error)
        }
    }, receiveValue: { value in
        print("receiveValue:", value)
    })
}

print("")

do {
    print("Subject : CurrentValueSubject")
    let subject: CurrentValueSubject<String, Error> = .init("current")
    let cancellable = subject.sink(receiveCompletion: { (completion) in
        switch completion {
        case .finished: print("finished")
        case .failure(let error): print("error:", error)
        }
    }, receiveValue: { value in
        print("receiveValue:", value)
    })
    subject.send("value 1")
    print("value:", subject.value)
    subject.value = "value 2"
    print("value:", subject.value)
    subject.send(completion: .finished)
    subject.send("value 3")
    print("value:", subject.value)
    cancellable.cancel()
}

print("")

do {
    print("Subject : PassthroughSubject")
    let subject: PassthroughSubject<String, Error> = .init()
    subject.send("value 1")
    let cancellable = subject.sink(receiveCompletion: { (completion) in
        switch completion {
        case .finished: print("finished")
        case .failure(let error): print("error:", error)
        }
    }, receiveValue: { value in
        print("receiveValue:", value)
    })
    subject.send("value 2")
    subject.send(completion: .finished)
    subject.send("value 3")
    cancellable.cancel()
}

print("")

do {
    print("publisher : Published")
    class Person {
        @Published var name: String
        init(name: String) {
            self.name = name
        }
    }
    let foo = Person(name: "foo")
    let _ = foo.$name.sink { print("name:", $0) }
}

