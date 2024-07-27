import SwiftUI

enum PageAction: Hashable {
    case gotoAlbumView(album: Album)
    case gotoSettingsView
}

enum UserAction {
    case albumTappedInAlbumsList(album: Album)
    case settingButtonTapped
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
        
    func pop() {
        path.removeLast()
    }
    
    func performedAction(action: UserAction) {
        switch action {
        case .albumTappedInAlbumsList(let album):
            path.append(PageAction.gotoAlbumView(album: album))
        case .settingButtonTapped:
            path.append(PageAction.gotoSettingsView)
        }
    }
    
    @ViewBuilder
    func buildView(forPageAction pageAction: PageAction) -> some View {
        switch pageAction {
        case .gotoAlbumView(let album):
            AlbumDetailView(album: album)
        case .gotoSettingsView:
            SettingsView()
        }
    }
}
