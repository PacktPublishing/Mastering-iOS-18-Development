import Foundation

struct ContactsDeltaUpdateResponse: Codable {
    let lastUpdated: Double
    let newContacts: [Contact]
    let deletedContacts: [Contact]
    let updatedContacts: [Contact]
}

class ContactsSyncManager {
    
    let userDefaults = UserDefaults.standard
    let lastUpdatedKey = "lastUpdatedTime"
    let syncEndpoint = URL(string: "https://example.com/api/sync/contacts")!
    
    func syncContacts() {
        var request = URLRequest(url: syncEndpoint)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let lastUpdatedTime = userDefaults.double(forKey: lastUpdatedKey)
        let requestBody = ["lastUpdatedTime": lastUpdatedTime]
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error during sync: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let response = try? JSONDecoder().decode(ContactsDeltaUpdateResponse.self, from: data) else {
                print("Failed to parse response")
                return
            }
            
            self.processDeltaUpdates(response: response)
        }.resume()
    }
    
    private func processDeltaUpdates(response: ContactsDeltaUpdateResponse) {
        // Here you can handle the new, deleted, and updated contacts as needed
        print("New Contacts: \(response.newContacts.count)")
        print("Deleted Contacts: \(response.deletedContacts.count)")
        print("Updated Contacts: \(response.updatedContacts.count)")
        
        // Update the last updated time in UserDefaults
        userDefaults.set(response.lastUpdated, forKey: lastUpdatedKey)
    }
}
