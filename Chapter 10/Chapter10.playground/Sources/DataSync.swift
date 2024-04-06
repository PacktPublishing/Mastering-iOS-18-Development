import Foundation

// Network Handler
class NetworkHandler {
    static func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        // Simulating network call
        DispatchQueue.global().async {
            if let url = URL(string: "https://api.example.com/contacts") {
                do {
                    let data = try Data(contentsOf: url)
                    completion(.success(data))
                } catch {
                    completion(.failure(error))
                }
            } else {
                let error = NSError(domain: "InvalidURL", code: 0, userInfo: nil)
                completion(.failure(error))
            }
        }
    }
}

class DataStore {
    private var contacts: [Contact] = []
    
    func updateContacts(with newContacts: [Contact]) {
        contacts = newContacts
    }
    
    func getAllContacts() -> [Contact] {
        return contacts
    }
}

class SyncManager {
    private let dataStore: DataStore
    
    init(dataStore: DataStore) {
        self.dataStore = dataStore
    }
    
    func syncData() {
        NetworkHandler.fetchData { result in
            switch result {
            case .success(let data):
                do {
                    let contacts = try JSONDecoder().decode([Contact].self, from: data)
                    self.dataStore.updateContacts(with: contacts)
                    print("Data synced successfully")
                } catch {
                    print("Error decoding data:", error)
                }
            case .failure(let error):
                print("Error fetching data:", error)
            }
        }
    }
}

let dataStore = DataStore()
let syncManager = SyncManager(dataStore: dataStore)

syncManager.syncData()

let contacts = dataStore.getAllContacts()
print("Contacts:", contacts)
