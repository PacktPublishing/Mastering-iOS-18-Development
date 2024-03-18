//
//  RuleBasedTipView.swift
//  TipKitApp
//
//  Created by Avi Tsadok on 11/03/2024.
//

import SwiftUI
import TipKit




struct ChangeAppThemeTip: Tip {
    var title: Text {
        Text("Premium user? Change your app theme!")
    }
    
    var message: Text? {
        Text("You can change your app theme by pressing this button")
    }
    
    var id: String { "change-app-theme"}
    
    @Parameter
    static var isPremiumUser: Bool = false
    
    var rules: [Rule] {
        [
            #Rule(Self.$isPremiumUser) {
                $0 == true
            }

        ]
    }
}


struct RuleBasedTipView: View {
    let tip = ChangeAppThemeTip()
    var body: some View {
        VStack {
            Button("Change isPremium parameter") {
                ChangeAppThemeTip.isPremiumUser.toggle()                
            }
            TipView(tip)
        }
    }
}

#Preview {
    RuleBasedTipView()
}
