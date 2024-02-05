//
//  ContentView.swift
//  Chapter3
//
//  Created by Avi Tsadok on 29/09/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var books: [Book]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(books) { book in
                    Text(book.name)
                    Text(book.publicationName)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newBook = Book(publicationName: "Packt", name: "My Book", subtitle: "A book about SwiftData")
            modelContext.insert(newBook)
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Book.self, inMemory: true)
}
