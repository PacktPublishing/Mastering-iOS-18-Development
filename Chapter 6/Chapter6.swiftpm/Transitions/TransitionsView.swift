import SwiftUI

struct TransitionsView: View {
    var body: some View {
        List {
            NavigationLink(destination: BuiltInTransitionsView()) { Text("Built in transitions") }
            NavigationLink(destination: CustomizedTransitionView()) { Text("Customized transitions") }
        }
    }
}

#Preview {
    TransitionsView()
}
