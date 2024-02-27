//
//  UsingWithAnimationFunction.swift
//  Chapter8
//
//  Created by Avi Tsadok on 15/02/2024.
//

import SwiftUI

struct UsingWithAnimationFunction: View {
    @State var greenCircleYPosition: CGFloat = 400
    @State var redCircleYPosition: CGFloat = 800
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .size(width: 100.0, height: 100.0)
                    .foregroundColor(.green)
                    .position(x: 400, y: greenCircleYPosition)
                
                Circle()
                    .size(width: 100.0, height: 100.0)
                    .foregroundColor(.red)
                    .position(x: 200, y: redCircleYPosition)
            }
            
            Button("Animate") {
                withAnimation {
                    greenCircleYPosition = greenCircleYPosition == 400 ? 800 : 400
                    redCircleYPosition = redCircleYPosition == 800 ? 400 : 800
                }
            }
        }
    }
}


#Preview {
    UsingWithAnimationFunction()
}
