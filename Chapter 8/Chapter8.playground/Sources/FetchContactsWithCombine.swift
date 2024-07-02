import Foundation
import Combine


class ContactRequest {
    func fetchData() -> AnyPublisher<[Contact], Error> {
        let url = URL(string: "https://api.example.com/contacts")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Contact].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

class DataStore {
    @Published var contacts: [Contact] = []
}

class ContactsSync {
    let contactRequest = ContactRequest()
    let dataStore = DataStore()
    
    func syncContacts() {
        contactRequest.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Data fetch completed successfully")
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { [weak self] contacts in
                self?.dataStore.contacts = contacts
            })
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
}

// Example usage
let contactsSync = ContactsSync()
contactsSync.syncContacts()
