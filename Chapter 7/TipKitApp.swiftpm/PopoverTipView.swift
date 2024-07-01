//
//  PopoverTipView.swift
//  TipKitApp
//
//  Created by Avi Tsadok on 02/03/2024.
//

import SwiftUI
import TipKit

struct PopoverTip: Tip {
    var title: Text {
        Text("Change your app settings")
    }
    
    var message: Text? {
        Text("Tap here to customize your theme, manage your favories change account.")
    }
    
    var image: Image? {
        return Image(systemName: "gearshape")
    }
    
    var id: String { "settingsTip" }
}

struct PopoverTipView: View {
    var tip = PopoverTip()
    var body: some View {
        List {
            Text("Do something")
        }
        .navigationTitle("Popover Tip")
        .toolbar(content: {
            Button("Settings", systemImage: "gearshape") {
            }
            .buttonStyle(.plain)
            .popoverTip(tip, arrowEdge: .top)
        })
    }
}

#Preview {
    PopoverTipView()
}
