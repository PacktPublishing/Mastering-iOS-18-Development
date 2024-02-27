//
//  KeyFrameAnimationWithRelativeDurationView.swift
//  Chapter8
//
//  Created by Avi Tsadok on 25/02/2024.
//

import SwiftUI

struct KeyFrameAnimationWithRelativeDurationView: View {
    
    let duration: TimeInterval = 1.8
    
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
                    CubicKeyframe(0.7, duration: 0.44 * duration)
                    CubicKeyframe(1.0,
                                  duration: 0.44 * duration)
                }
                
                KeyframeTrack(\.opacity) {
                    CubicKeyframe(0.3, duration: 0.44 * duration)
                    CubicKeyframe(1.0, duration: 0.44 * duration)
                }
            }
    }
}

#Preview {
    KeyFrameAnimationWithRelativeDurationView()
}
