import Foundation

enum NetworkingError: Error {
    case invalidResponse
    case clientError(statusCode: Int)
    case serverError(statusCode: Int)
    case dataError
    case otherError
}

func handleResponse(data: Data?, response: URLResponse?, error: Error?) throws {
    if let error = error {
        throw error
    }
    
    guard let httpResponse = response as? HTTPURLResponse else {
        throw NetworkingError.invalidResponse
    }
    
    switch httpResponse.statusCode {
    case 200..<300:
        if let responseData = data {
            if let errorData = try? JSONDecoder().decode(ErrorResponse.self, from: responseData) {
                throw NetworkingError.dataError
            }
        }
    case 400..<500:
        throw NetworkingError.clientError(statusCode: httpResponse.statusCode)
    case 500..<600:
        throw NetworkingError.serverError(statusCode: httpResponse.statusCode)
    default:
        throw NetworkingError.otherError
    }
}

do {
    try handleResponse(data: nil, response: nil, error: NSError(domain: "example", code: 404, userInfo: nil))
} catch let error {
    print("Error: \(error)")
}
