import SwiftUI
import Observation

@Observable
class ComposeDraftManager {
    static let shared = ComposeDraftManager()
    
    var isPresentingCompose: Bool = false
}
