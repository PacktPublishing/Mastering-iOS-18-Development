import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    
    var body: some View {
        List {
            Section(header: Text("General")) {
                Toggle(isOn: $notificationsEnabled) {
                    Text("Enable Notifications")
                }
                
                Toggle(isOn: $darkModeEnabled) {
                    Text("Enable Dark Mode")
                }
            }
            
            Section(header: Text("Account")) {
                Text("Profile Settings")
                
                Text("Privacy Settings")

            }
        }
        .navigationTitle("Settings")
        .listStyle(GroupedListStyle())
    }
}
