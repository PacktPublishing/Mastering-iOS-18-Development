import Combine
import Foundation

struct SearchResult {
    let id: Int
    let title: String
}

func searchLocalDatabase(query: String) -> AnyPublisher<[SearchResult], Never> {
    return Just([
        SearchResult(id: 1, title: "Local Result 1"),
        SearchResult(id: 2, title: "Local Result 2")
    ])
    .delay(for: .seconds(1), scheduler: DispatchQueue.main) // Simulating delay
    .eraseToAnyPublisher()
}

func searchServer(query: String) -> AnyPublisher<[SearchResult], Never> {
    return Future { promise in
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            promise(.success([
                SearchResult(id: 3, title: "Server Result 1"),
                SearchResult(id: 4, title: "Server Result 2")
            ]))
        }
    }
    .eraseToAnyPublisher()
}

var cancellables = Set<AnyCancellable>()
let query = "example"
var totalResults = [SearchResult]()
searchLocalDatabase(query: query)
    .merge(with: searchServer(query: query))
    .sink(receiveCompletion: { _ in }, receiveValue: { results in
        totalResults.append(contentsOf: results)
        print("Search results: \(totalResults)")
    })
    .store(in: &cancellables)
