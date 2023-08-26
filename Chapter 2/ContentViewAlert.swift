import SwiftUI

struct ContentViewAlert: View {
    
    @State private var isShowAlert = false
    @State private var password = ""
    
    var body: some View {
        Button("Show") {
            isShowAlert = true
        }
        .alert("Authentication Alert",
               isPresented: $isShowAlert) {
            SecureField("Password", text: $password)
            Button("OK", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please fill your password to continue")
        }
    }
}

#Preview {
    ContentViewAlert()
}
