//
//  BuiltInTransitionsView.swift
//  Chapter8
//
//  Created by Avi Tsadok on 18/02/2024.
//

import SwiftUI

struct BuiltInTransitionsView: View {
    @State var showSlideText: Bool = false
    @State var showMoveText: Bool = false
    @State var showScaleText: Bool = false
    @State var showOpacityText: Bool = false
    @State var showAsymmetricTransition: Bool = false
    @State var showCombinedTransition: Bool = false
    
    var body: some View {
        VStack {
            Button("Slide in text") {
                withAnimation {
                    showSlideText.toggle()
                }
            }
            Button("Move in text") {
                withAnimation {
                    showMoveText.toggle()
                }
            }
            Button("Scale in text") {
                withAnimation {
                    showScaleText.toggle()
                }
            }
            Button("Opacity in text") {
                withAnimation {
                    showOpacityText.toggle()
                }
            }
            Button("Scale in, slide out") {
                withAnimation {
                    showAsymmetricTransition.toggle()
                }
            }
            Button("Combined transition") {
                withAnimation {
                    showCombinedTransition.toggle()
                }
            }
            if showSlideText {
                Text("Hello, slided text").transition(.slide)
            }
            if showMoveText {
                Text("Hello, moved text")
                    .transition(.move(edge: .bottom))
            }
            if showScaleText {
                Text("Hello, scaled text")
                    .transition(.scale(scale: 0.5, anchor: .center))
            }
            if showOpacityText {
                Text("Hello, opacity text")
                    .transition(.opacity)
            }
            if showAsymmetricTransition {
                Text("Text scaled in. Now it will slide out")
                    .transition(.asymmetric(insertion: .scale, removal: .slide))
            }
            if showCombinedTransition {
                Text("Scale and slide")
                    .transition(.scale.combined(with: .slide.combined(with: .opacity)))
            }
        }
    }
}

#Preview {
    BuiltInTransitionsView()
}
