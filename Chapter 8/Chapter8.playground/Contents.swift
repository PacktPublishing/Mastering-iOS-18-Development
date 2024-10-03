import Foundation

// Define the URL
let urlString = "https://jsonplaceholder.typicode.com/posts"

// Create URL object from the string
if let url = URL(string: urlString) {
    // Create URLRequest object
    var request = URLRequest(url: url)
    request.httpMethod = "GET" // Specify the HTTP method (GET in this case)
    
    // Create URLSession object
    let session = URLSession(configuration: .default)
    
    // Create a data task
    let task = session.dataTask(with: request) { (data, response, error) in
        // Check for errors
        if let error = error as? URLError {
            switch error.code {
            case .cannotFindHost:
                print("cannot find host")
            default:
                print("Error: \(error)")
            }
            return
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200..<300:
                print("Success: \(httpResponse.statusCode)")
            case 400..<500:
                print("Client Error: \(httpResponse.statusCode)")
            case 500..<600:
                print("Server Error: \(httpResponse.statusCode)")
            default:
                print("Other Status Code: \(httpResponse.statusCode)")
            }
        } else {
            print("Invalid HTTP Response")
        }
        
        // Check if response contains data
        guard let responseData = data else {
            print("Error: Did not receive data")
            return
        }
        
        do {
            // Parse JSON data
            if let jsonArray = try JSONSerialization.jsonObject(with: responseData, options: []) as? [[String: Any]] {
                // Print the JSON response
                print(jsonArray)
            } else {
                print("Error: Unable to parse JSON data")
            }
        } catch let parseError {
            print("Error: \(parseError)")
        }
    }
    
    // Start the data task
    task.resume()
} else {
    print("Error: Invalid URL")
}
