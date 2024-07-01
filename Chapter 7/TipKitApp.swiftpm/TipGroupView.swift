//
//  TipGroupView.swift
//  TipKitApp
//
//  Created by Avi Tsadok on 27/06/2024.
//

import SwiftUI
import TipKit


struct SettingsTip: Tip {
    var title: Text { Text("Tap here to go to settings") }
}

struct ProfileTip: Tip {
    var title: Text { Text("Tap here to open the profile page") }
}

struct TipGroupView: View {
        
    @State var tips = TipGroup(.ordered) {
        SettingsTip()
        ProfileTip()
    }
    
    var body: some View {
        Button("Settings") {
            
        }.popoverTip(tips.currentTip as? SettingsTip)
        
        Button("Profile") {
            
        }.popoverTip(tips.currentTip as? ProfileTip)
    }
}

#Preview {
    TipGroupView()
}
