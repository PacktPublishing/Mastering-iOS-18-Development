//
//  TipViewStyleView.swift
//  TipKitApp
//
//  Created by Avi Tsadok on 08/03/2024.
//

import SwiftUI
import TipKit

struct ImageAtTheCornerViewStyle: TipViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            if let title = configuration.title, let message = configuration.message {
                title
                    .multilineTextAlignment(.center)
                    .font(.title2)
                Divider()
                message
                    .multilineTextAlignment(.leading)
                    .font(.body)
            }
            
            HStack {
                Spacer()
                Image(systemName: "star")
            }
            .padding()
        }
    }
}

struct TipViewStyleView: View {
    let tip = MarkAsFavoriteTip()
    var body: some View {
        VStack {
            TipView(tip)
                .tipViewStyle(ImageAtTheCornerViewStyle())
        }
        
    }
}

#Preview {
    TipViewStyleView()
}
