//
//  UsingAnimationModifier.swift
//  Chapter8
//
//  Created by Avi Tsadok on 14/02/2024.
//

import SwiftUI

struct UsingAnimationModifier: View {
    @State var width: CGFloat = 50
    @State var height: CGFloat = 50
    var body: some View {
        ZStack {
            Circle()
                .frame(width:width, height:height)
                .foregroundColor(.blue)
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: width)
                .onTapGesture {
                    width += 50
                    height += 50
                }
        }
    }
}

#Preview {
    UsingAnimationModifier()
}
