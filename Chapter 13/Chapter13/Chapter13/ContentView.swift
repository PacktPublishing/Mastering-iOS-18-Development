import SwiftUI
import UniformTypeIdentifiers

struct Book: Codable {
    let title: String
    let author: String
    let numberOfPages: Int
}

extension UTType {
    static var book: UTType = UTType(exportedAs: "com.myapp.book")
}

extension Book: Transferable {
    var fullDescription: String { title + ", " + author}
    
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .book)
        ProxyRepresentation(exporting: \.fullDescription)
    }
}

struct ContentView: View {
    
    let book: Book = Book(title: "How to use ShareLinks", author: "Avi Tsadok", numberOfPages: 150)
    
    let appleURL = URL(string: "https://www.apple.com")!
    
    var body: some View {
        VStack {
            ShareLink("Open", item: appleURL)
            ShareLink(item: book, preview: SharePreview(book.fullDescription))
            ShareLink(item: "Simple text")
        }
    }
}


#Preview {
    ContentView()
}
