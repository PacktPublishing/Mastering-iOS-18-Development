//
//  SFSymbolsAnimationView.swift
//  Chapter8
//
//  Created by Avi Tsadok on 25/02/2024.
//

import SwiftUI

struct SFSymbolsAnimationView: View {
    @State private var animate = false
    var body: some View {
        VStack {
            Spacer()

            HStack {
                Image(systemName: "person.2.wave.2")
                    .foregroundStyle(.brown, .blue)
                    .symbolEffect(.bounce, options: .repeating, value: animate)
                
                Text("10:30")
            }.font(.system(size: 40))
                .onTapGesture {
                    animate = true
                }
            Image(systemName: "person.3.sequence.fill")
                .foregroundStyle(.red, .blue, .brown)
                .font(.system(size: 40))
            
            Spacer()
            Image(systemName: "arrowshape.turn.up.forward")
                .font(.system(size: 30))
                .environment(\.layoutDirection, .rightToLeft)
            Image(systemName: "arrowshape.turn.up.forward")
                .font(.system(size: 30))
                .environment(\.layoutDirection, .leftToRight)
            Image(systemName: "character.book.closed")
                .font(.system(size: 100))
                .environment(\.locale, .init(identifier: "he"))
            Spacer()
        }

    }
}

#Preview {
    SFSymbolsAnimationView()
}
