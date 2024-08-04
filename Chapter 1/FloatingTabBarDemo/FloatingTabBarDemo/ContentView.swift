import SwiftUI

struct ContentView: View {
    
        
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {  }
            
            Tab("Profile", systemImage: "person.crop.circle") { }
            
            Tab("Settings", systemImage: "gear") { }
        }
        .tint(.red)
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    ContentView()
}
