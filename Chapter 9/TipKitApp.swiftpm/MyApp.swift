import SwiftUI
import TipKit

@main
struct MyApp: App {
    
    init() {
//        try? Tips.resetDatastore()
        try? Tips.configure([.displayFrequency(.hourly)])
//        try? Tips.configure([
//                 .datastoreLocation(.groupContainer(identifier: "MyGroupContainer"))])
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(.red)
        }
    }
}
