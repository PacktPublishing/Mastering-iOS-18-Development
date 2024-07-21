import SwiftUI
import CoreSpotlight

struct SemanticSearchView: View {
    @State private var searchText = ""
    @State private var searchResults: [CSSearchableItem] = []

    
    var body: some View {
        NavigationView {
            List(searchResults, id: \.uniqueIdentifier) { item in
                VStack(alignment: .leading) {
                    Text(item.attributeSet.title ?? "No title")
                    Text(item.attributeSet.contentDescription ?? "No description")
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText, {
                Task {
                    await performSearch(query: searchText) { items in
                        self.searchResults = items
                    }
                }
            })
            .navigationTitle("Book Search")
        }
        .onAppear {
            prepareModel()
            indexBooks(Book.List)
        }
    }
    
    func indexBooks(_ books: [Book]) {
        let searchableItems: [CSSearchableItem] = books.map { book in
            let attributeSet = CSSearchableItemAttributeSet(contentType: .text)
            attributeSet.title = book.title
            attributeSet.contentDescription = book.author
            
            let item = CSSearchableItem(uniqueIdentifier: book.id, domainIdentifier: "books", attributeSet: attributeSet)
            return item
        }
        
        let index = CSSearchableIndex(name: "SpotlightSearchIndex")
        index.indexSearchableItems(searchableItems) { error in
            if let error = error {
                print("Indexing error: \(error.localizedDescription)")
            } else {
                print("Books successfully indexed!")
            }
        }
    }
    
    func prepareModel() {
        CSUserQuery.prepare()
        CSUserQuery.prepareProtectionClasses([.completeUnlessOpen])
    }
    
    func performSearch(query: String, completion: @escaping ([CSSearchableItem]) -> Void) async {
        let searchContext = CSUserQueryContext()
        searchContext.fetchAttributes = ["title"]
        searchContext.enableRankedResults = true
                
        var items: [CSSearchableItem] = []
        let query = CSUserQuery(userQueryString: query, userQueryContext: searchContext)
        do {
            for try await element in query.responses {
                switch(element) {
                case .item(let item):
                    items.append(item.item)
                    break
                case .suggestion(let suggestion):
                    // handle suggestions.
                    break
                @unknown default:
                    break
                }
            }
            self.searchResults = items
        } catch let error {
            print(error.localizedDescription)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SemanticSearchView()
    }
}
