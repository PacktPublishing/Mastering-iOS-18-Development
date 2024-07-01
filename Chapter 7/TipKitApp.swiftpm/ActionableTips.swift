//
//  ActionableTips.swift
//  TipKitApp
//
//  Created by Avi Tsadok on 10/03/2024.
//

import SwiftUI
import TipKit


struct ChangeEmailTip: Tip {
    var id: String { "ChangeEmailTip" }
    
    var title: Text { Text("Change your email") }
    
    var message: Text? { Text("You can change your email in the settings screen") }
    
    var actions: [Action] {
        
        Action(id: ChangeEmailTip.goToSettingsAction, title: "Go to settings")
        
        Action(id: ChangeEmailTip.changeEmailAction, title: "Change email now")
        
    }
    
    static let goToSettingsAction = "go-to-settings"
    
    static let changeEmailAction = "change-now"
    
}

struct ActionableTips: View {
    
    let tip = ChangeEmailTip()
    @State var gotoSettings: Bool = false
    
    var body: some View {
        NavigationView(content: {
            List {
                Text("Do something")
            }
        }
        )        
        .navigationDestination(isPresented: $gotoSettings, destination: {
            SettingsScreen()
        })
        .navigationTitle("Popover Tip")
        .toolbar(content: {
            Button("Settings", systemImage: "gearshape") {
                gotoSettings = true
            }
            .buttonStyle(.plain)
            .popoverTip(tip, arrowEdge: .top) { action in
                if action.id == ChangeEmailTip.goToSettingsAction {
                    gotoSettings = true
                }
            }
        })

    }
}


struct SettingsScreen: View {
    var body: some View {
        VStack {
            Text("Settings Screen!")
        }
    }
}

#Preview {
    ActionableTips()
}
