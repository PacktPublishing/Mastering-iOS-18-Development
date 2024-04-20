import Combine

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<Int, Never>()

let cancellable = publisher1
    .zip(publisher2)    
    .sink { value in
    print("Zipped value: \(value)")
}

publisher1.send(1)  // no output
publisher2.send(10) // output is (1,10)
publisher1.send(2)  // no output
publisher2.send(20) // output is (2,20)
