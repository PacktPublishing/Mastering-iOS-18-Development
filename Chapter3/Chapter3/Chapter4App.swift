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
struct Chapter3App: App {
    var themes: Themes = Themes()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(themes)
        }
    }
}
