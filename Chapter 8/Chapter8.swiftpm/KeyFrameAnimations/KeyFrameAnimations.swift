//
//  KeyFrameAnimations.swift
//  Chapter8
//
//  Created by Avi Tsadok on 21/02/2024.
//

import SwiftUI

struct AnimationProperties {
    var scale = 1.0
    var opacity = 1.0
}

struct KeyFrameAnimations: View {
    var body: some View {
        Circle()
            .foregroundColor(.red)
            .frame(width:100, height:100)
            .keyframeAnimator(initialValue: AnimationProperties(), repeating: true) { content, value in
                content
                    .opacity(value.opacity)
                    .scaleEffect(value.scale)
                
            } keyframes: { _ in
                KeyframeTrack(\.scale) {
                    CubicKeyframe(0.7, duration: 0.8)
                    CubicKeyframe(1.0,
                                  duration: 0.8)
                }
                
                KeyframeTrack(\.opacity) {
                    CubicKeyframe(0.3, duration: 0.8)
                    CubicKeyframe(1.0, duration: 0.8)
                }
            }
    }
}

#Preview {
    KeyFrameAnimations()
}
