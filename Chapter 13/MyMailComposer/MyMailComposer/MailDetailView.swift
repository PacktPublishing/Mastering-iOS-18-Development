import SwiftUI

struct MailDetailView: View {
    let mail: Mail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("From: \(mail.sender)")
                .font(.headline)
            Text("Subject: \(mail.subject)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(mail.body)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle("Mail")
    }
}
