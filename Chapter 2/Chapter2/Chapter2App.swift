import SwiftUI
import SwiftData

@main
struct Chapter3App: App {
            
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Book.self,
        ])                        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
