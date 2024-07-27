import SwiftUI

struct CoordinatorView: View {
    
    @ObservedObject private var coordinator = Coordinator()
            
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            AlbumListView()
                .navigationDestination(for: PageAction.self, destination: { pageAction in
                    coordinator.buildView(forPageAction: pageAction)
                })
        }
        .environmentObject(coordinator)
    }
}
