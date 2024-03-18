//
//  CustomizeTipViewProperties.swift
//  TipKitApp
//
//  Created by Avi Tsadok on 08/03/2024.
//

import SwiftUI
import TipKit

struct PropertiesStyledTip: Tip {
    var id: String { "properties_styled_tip" }
    
    var title: Text {
        Text("Save as a ")
            .fontWeight(.light) +
        Text("Favorite")
            .fontWeight(.bold)
            .foregroundStyle(.red)            
    }
    
    var message: Text? {
        Text("You can mark items as Favorite and add them to your favorites list.")
            .font(.title)
            .foregroundStyle(.blue)
    }
    
    var image: Image? {
        Image(systemName: "externaldrive.fill.badge.icloud")
            .symbolRenderingMode(.multicolor)
    }
}

struct CustomizeTipViewProperties: View {
    
    let styledTip = PropertiesStyledTip()
    
    var body: some View {
        VStack {
            TipView(styledTip)
        }
        
    }
}

#Preview {
    CustomizeTipViewProperties()
}
