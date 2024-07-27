import SwiftUI

struct AlbumListView: View {
    let albums = [
        Album(title: "Album 1", artist: "Artist 1"),
        Album(title: "Album 2", artist: "Artist 2"),
        Album(title: "Album 3", artist: "Artist 3"),
    ]
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        List(albums) { album in
            VStack(alignment: .leading) {
                Text(album.title)
                    .font(.headline)
                Text(album.artist)
                    .font(.subheadline)
            }
            .onTapGesture {
                coordinator.performedAction(action: .albumTappedInAlbumsList(album: album))
            }
        }
        .navigationTitle("Albums")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    coordinator.performedAction(action: .settingButtonTapped)
                }) {
                    Image(systemName: "gear")
                }
            }
        }
    }
}
