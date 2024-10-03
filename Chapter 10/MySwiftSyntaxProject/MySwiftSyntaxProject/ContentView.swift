//
//  ContentView.swift
//  MySwiftSyntaxProject
//
//  Created by Avi Tsadok on 31/08/2023.
//

import SwiftUI
import StructInitMacro


@StructInit
struct Book {
    let author: String
    let pages: Int
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
