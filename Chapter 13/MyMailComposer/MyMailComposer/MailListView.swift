import SwiftUI

struct MailListView: View {
    @State private var mails = [
        Mail(sender: "Alice", subject: "Meeting Tomorrow", body: "Hey, don't forget our meeting tomorrow at 10am."),
        Mail(sender: "Bob", subject: "Lunch Plans", body: "Let's have lunch at 1pm."),
        Mail(sender: "Charlie", subject: "Project Update", body: "The project is progressing as planned.")
    ]
    
    @State private var draftManager = ComposeDraftManager.shared
    
    @State private var isPresentingCompose = false
    
    var body: some View {
        NavigationView {
            List(mails) { mail in
                NavigationLink(destination: MailDetailView(mail: mail)) {
                    VStack(alignment: .leading) {
                        Text(mail.sender)
                            .font(.headline)
                        Text(mail.subject)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Inbox")
            .navigationBarItems(trailing: Button(action: {
                draftManager.isPresentingCompose = true
            }) {
                Image(systemName: "square.and.pencil")
            })
            .sheet(isPresented: $draftManager.isPresentingCompose) {
                ComposeMailView()
            }
        }
    }
}
