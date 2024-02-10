//
//  InspectorView.swift
//  PresentationModifiers
//
//  Created by Avi Tsadok on 10/02/2024.
//

import SwiftUI

struct InspectorView: View {
    
    @State var isInspectorShown: Bool = false
    
    var body: some View {
        Button("Show Inspector") {
            isInspectorShown.toggle()
        }.inspector(isPresented: $isInspectorShown) {
            Text("Hello World")
                .presentationDetents([.medium, .large])
        }

    }
}

#Preview {
    InspectorView()
}
