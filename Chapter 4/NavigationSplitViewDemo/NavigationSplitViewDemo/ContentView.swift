import SwiftUI

struct Album: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let songs: [Song]
}

struct Song: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let artist: String
}

struct ContentView: View {
    @State private var selectedAlbum: Album?
    @State private var selectedSong: Song?
    
    let albums = [
        Album(title: "Album 1", songs: [
            Song(title: "Song 1-1", artist: "Artist 1"),
            Song(title: "Song 1-2", artist: "Artist 2"),
        ]),
        Album(title: "Album 2", songs: [
            Song(title: "Song 2-1", artist: "Artist 3"),
            Song(title: "Song 2-2", artist: "Artist 4"),
        ]),
    ]
    
    var body: some View {
        NavigationSplitView {
            List(albums, selection: $selectedAlbum) { album in
                NavigationLink(album.title, value: album)
            }
        } content: {
            if let selectedAlbum = selectedAlbum {
                List(selectedAlbum.songs, selection: $selectedSong) { song in
                    NavigationLink(song.title, value: song)
                }
                .navigationTitle(selectedAlbum.title)
            } else {
                Text("Select an album")
            }
        } detail: {
            if let selectedSong = selectedSong {
                VStack {
                    Text("Song Title: \(selectedSong.title)")
                    Text("Artist: \(selectedSong.artist)")
                }
                .padding()
                .navigationTitle(selectedSong.title)
            } else {
                Text("Select a song")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
