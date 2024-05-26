import Foundation

class NetworkService {
 
    var analyticsService: AnalyticsServiceProtocol
    
    init(analyticsService: AnalyticsServiceProtocol) {
        self.analyticsService = analyticsService
    }
    
    func perform(request: NetworkRequest) {
        // perform function implementation
    }
    
}
