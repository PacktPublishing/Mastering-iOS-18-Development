import Foundation


struct ServerResponse: Codable {
    let responseID: String
    let timestamp: String
    let orgID: String
    let contact: Contact
}

let jsonString = """
{
   "responseID": "12345",
   "timestamp": "2024-03-25T12:00:00Z",
   "orgID": "5678",
   "contact": {
       "id": 1,
       "fullName": "John Doe",
       "userEmail": "john@example.com"
   }
}
"""

do {
    let jsonData = jsonString.data(using: .utf8)!
    let response = try JSONDecoder().decode(ServerResponse.self, from: jsonData)
    print(response)
} catch {
    print("Error decoding JSON: \(error)")
}
