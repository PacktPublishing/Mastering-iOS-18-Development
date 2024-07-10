import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink(destination: UsingAnimationModifier()) { Text("Animation view modifier") }
                NavigationLink(destination: UsingWithAnimationFunction()) { Text("withAnimation function") }
                NavigationLink(destination: WithAnimationCompletionBlock()) { Text("Adding a completion block") }
                NavigationLink(destination: TransitionsView()) { Text("Working with Transitions") }
                NavigationLink(destination: KeyFrameAnimations()) { Text("Key-frame animations") }
                NavigationLink(destination: KeyFrameAnimationWithRelativeDurationView()) { Text("Key-frame animations with relative durations") }  
                NavigationLink(destination: SFSymbolsAnimationView()) { Text("SFSymbols animations") }
                
            }
        })
        
    }
}
