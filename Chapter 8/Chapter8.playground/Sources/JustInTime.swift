import SwiftUI

struct ContactsView: View {
    @State private var contacts: [Contact] = []
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            List(contacts) { contact in
                VStack(alignment: .leading) {
                    Text(contact.name).font(.headline)
                    Text(contact.phoneNumber).font(.subheadline)
                }
            }
            .navigationTitle("Contacts")
            .onAppear {
                fetchContacts()
            }
            .overlay {
                if isLoading {
                    ProgressView("Loading...")
                }
            }
        }
    }
    
    private func fetchContacts() {
        isLoading = true
        let networkHandler = NetworkHandler()
        networkHandler.fetchData { fetchedContacts in
            contacts = fetchedContacts
            isLoading = false
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
