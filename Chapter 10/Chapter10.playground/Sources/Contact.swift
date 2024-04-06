import Foundation

struct Contact: Codable {
    let id: Int
    let fullName: String
    let userEmail: String
    
    // Define custom coding keys to match JSON keys
    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "name"
        case userEmail = "email"
    }
}

/**
 
 {
 "id": 1,
 "name": "John Doe",
 "email": "john@example.com"
 }

 
 */
