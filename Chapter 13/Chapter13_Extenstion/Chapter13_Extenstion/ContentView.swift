//
//  ContentView.swift
//  Chapter13_Extenstion
//
//  Created by Avi Tsadok on 16/05/2024.
//

import SwiftUI
import UniformTypeIdentifiers


extension UTType {
    static var book: UTType = UTType(exportedAs: "com.myapp.book")
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
