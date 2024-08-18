import SwiftUI


@Observable
class Navigator {
    var path:  NavigationPath = NavigationPath()
    
    static let shared = Navigator()
}
