import Foundation


func performRequestWithCustomConfiguration() {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 10
    configuration.requestCachePolicy = .reloadIgnoringLocalCacheData        
    let session = URLSession(configuration: configuration)
}

