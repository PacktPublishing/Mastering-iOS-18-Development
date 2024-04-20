import Combine

let numbersPublisher = Array(1...20).publisher

let subscription = numbersPublisher
    .filter { $0 % 2 == 0 }
    .map { "The number is \($0)" }
    .sink(receiveValue: { print($0) })
