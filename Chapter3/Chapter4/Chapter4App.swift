//
//  Chapter4App.swift
//  Chapter4
//
//  Created by Avi Tsadok on 01/10/2023.
//

import SwiftUI

struct ThemesKey: EnvironmentKey {
    static let defaultValue = Themes()
}

extension EnvironmentValues {
    var themes: Themes {
        get { self[ThemesKey.self]}
        set { self[ThemesKey.self] = newValue}
    }
}


@Observable
class Themes {
    var primaryColor: Color = .red
}

@main
struct Chapter4App: App {
    var themes: Themes = Themes()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(themes)
        }
    }
}
