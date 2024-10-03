import SwiftUI

struct ContactsView: View {
    @State private var contacts: [Contact] = []
    
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
                loadContacts()
            }
        }
    }
    
    private func loadContacts() {
        // Load from cache initially
        contacts = loadFromCache()
        
        // Fetch and update with fresh data
        NetworkHandler().fetchData { fetchedContacts in
            contacts = fetchedContacts
            saveToCache(contacts: fetchedContacts)
        }
    }
    
    private func loadFromCache() -> [Contact] {
        // Simulate loading contacts from a cache
        // In a real app, this would be a database or file system fetch
        return []
    }
    
    private func saveToCache(contacts: [Contact]) {
        // Simulate saving contacts to a cache
        // In a real app, this would write to a database or file system
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
        
