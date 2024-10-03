import UIKit


class IncrementalLoader {
    var currentPage = 1
    let itemsPerPage = 10
    var contacts = [Contact]()
    
    func loadNextPage() {
        guard let url = URL(string: "https://api.example.com/contacts?page=\(currentPage)&limit=\(itemsPerPage)") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }

            
            do {
                let newContacts = try JSONDecoder().decode([Contact].self, from: data)
                DispatchQueue.main.async {
                    self.contacts.append(contentsOf: newContacts)
                    print("Fetched Contacts: \(newContacts)")
                    self.currentPage += 1
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
}

