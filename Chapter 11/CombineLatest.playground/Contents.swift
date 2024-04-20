import Combine

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<Int, Never>()

let cancellable = publisher1
    .combineLatest(publisher2)
    .sink { value in
    print("Combined value: \(value)")
}

publisher1.send(1)
publisher2.send(10)
publisher1.send(2)
publisher2.send(20)
