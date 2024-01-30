//
//  ContentView.swift
//  Chapter4
//
//  Created by Avi Tsadok on 01/10/2023.
//

import SwiftUI
import Observation

@Observable
class Book {
    var title:String = ""
    var pages: Int = 0
    var averageWordsPerPage: Int = 0
    var totalWordsInBook: Int {
        return pages * averageWordsPerPage
    }
    
    @ObservationIgnored
    var bookComments:[String] = []
    
    var numberOfComments: Int {
        bookComments.count
    }
}

struct ContentView: View {
    var book:Book = Book()
    var counter = Counter()
    @Environment(Themes.self) var themes
    var body: some View {
        VStack {
            Text(book.title)
            Button("Change") {
                book.title = "Mastering iOS 18"
                book.averageWordsPerPage = 300
                book.pages = 200
                book.bookComments = ["Great book!", "Highly recommended!"]
                themes.primaryColor = themes.primaryColor
            }
            Text("number of pages in the book: \(book.totalWordsInBook)").foregroundStyle(themes.primaryColor)
            Text("Comments: \(book.bookComments.reduce("") { $0 + $1 })").foregroundStyle(themes.primaryColor)
            Text("Number of comments: \(book.numberOfComments)").foregroundStyle(themes.primaryColor)
            CounterView(counter: counter)
            Text("\(counter.value)")
        }
        .padding()
    }
}

@Observable
class Counter {
    
    var value: Int = 0
    
    func increment() {
        value += 1
    }
}

struct CounterView: View {
    @Bindable var counter: Counter
    
    var body: some View {
        VStack {
            Button("Increase") {
                counter.increment()
            }
        }
    }
}


#Preview {
    ContentView().environment(Themes())
}
