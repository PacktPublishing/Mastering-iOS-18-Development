import SwiftUI

struct InspectorView: View {
    
    @State var isInspectorShown: Bool = false
    
    var body: some View {
        Button("Show Inspector") {
            isInspectorShown.toggle()
        }.inspector(isPresented: $isInspectorShown) {
            Text("Hello World")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue)
                .presentationDetents([.medium, .large])
                .inspectorColumnWidth(ideal: 300)
        }
    }
}

#Preview {
    InspectorView()
}
