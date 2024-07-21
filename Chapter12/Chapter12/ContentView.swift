import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("NLP") {
                    NLPView()
                }
                NavigationLink("Vision framework") {
                    VisionView()
                }
                NavigationLink("Sound Analysis framework") {
                    SoundAnalysisView()
                }
                NavigationLink("Semantic Search") {
                    SemanticSearchView()
                }
                NavigationLink("CoreML") {
                    CoreMLView()
                }
            }
        }


    }
}

#Preview {
    ContentView()
}
