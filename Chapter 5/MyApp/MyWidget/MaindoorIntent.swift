import Foundation
import AppIntents

struct MaindoorIntent: SetValueIntent {
    static let title: LocalizedStringResource = "Maindoor opening"
    
    @Parameter(title: "is open")
    var value: Bool
    
    func perform() throws -> some IntentResult {
        HouseManager.shared.isOpen = value
        return .result()
    }
}
