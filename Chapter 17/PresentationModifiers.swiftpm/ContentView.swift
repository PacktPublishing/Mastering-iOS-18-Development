import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AlertsView()) {
                    Text("Alerts")
                }
                NavigationLink(destination: SheetsView()) {
                    Text("Sheets")
                }
                NavigationLink(destination: InspectorView()) {
                    Text("Inspector")
                }
            }.navigationTitle("Presentation Modifiers")
        }
    }
}
