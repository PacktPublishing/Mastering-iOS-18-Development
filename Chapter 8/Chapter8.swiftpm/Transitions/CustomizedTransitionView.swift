//
//  CustomizedTransitionView.swift
//
//
//  Created by Avi Tsadok on 18/02/2024.
//

import SwiftUI

struct CustomizedTransitionView: View {
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .transition(rotate)
            }
            
            Spacer()
            
            Button("Insert Rectangle") {
                withAnimation {
                    showRectangle.toggle()
                }
            }
        }
    }
}


struct ViewRotationModifier: ViewModifier {
    let angle: Angle
    let opacity: CGFloat
    let scale: CGFloat
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(angle)
            .scaleEffect(scale)
            .opacity(opacity)
    }
}

let rotate = AnyTransition.modifier(
    active: ViewRotationModifier(angle: .degrees(360), opacity: 0.0, scale: 0.0),
    identity: ViewRotationModifier(angle: .degrees(0), opacity: 1.0, scale: 1.0)
)


#Preview {
    CustomizedTransitionView()
}
