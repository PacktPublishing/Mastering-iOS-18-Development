import SwiftUI

struct CoreMLView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Message Classifier") {
                    MessageClassifierView()
                }
            }
        }
    }
}

#Preview {
    CoreMLView()
}
