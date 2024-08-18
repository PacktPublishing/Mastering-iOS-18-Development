import SwiftUI

struct ComposeMailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var recipient = ""
    @State private var subject = ""
    @State private var mailbody = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("To")) {
                    TextField("Recipient", text: $recipient)
                }
                Section(header: Text("Subject")) {
                    TextField("Subject", text: $subject)
                }
                Section(header: Text("Body")) {
                    TextEditor(text: $mailbody)
                        .frame(height: 200)
                }
            }
            .navigationTitle("Compose")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Send") {
                // Handle send action here
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
