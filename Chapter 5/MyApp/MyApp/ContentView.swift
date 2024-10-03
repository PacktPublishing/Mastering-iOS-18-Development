import SwiftUI
import WidgetKit

struct ContentView: View {
    @State var text: String = "Hello"
    
    var body: some View {
        VStack {
            Text(text)
                .contentTransition(.numericText())
            
            Button("Change Text") {
                withAnimation() {
                    self.text = "Good bye"
                }
            }
        }
    }
    
    func getConfigurations() {
        WidgetCenter.shared.getCurrentConfigurations { result in
            if let widgets = try? result.get() {
                // handle our widgets
            }
        }
        
    }
    
    func reloadWidgetTimeline() {
        WidgetCenter.shared.reloadTimelines(ofKind: "MyWidget")
        WidgetCenter.shared.reloadAllTimelines()
    }
}

#Preview {
    ContentView()
}
