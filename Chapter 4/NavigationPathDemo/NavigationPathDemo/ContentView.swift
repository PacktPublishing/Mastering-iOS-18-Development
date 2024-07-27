import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    @State private var albums: [Album] = [Album(title: "Album 1"), Album(title: "Album 2")]
    @State private var songs: [Song] = [Song(title: "Song 1"), Song(title: "Song 2")]
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                List {
                    Section(header: Text("Songs")) {
                        ForEach(songs) { song in
                            Button(action: {
                                navigationPath.append(song)
                            }) {
                                Text(song.title)
                            }
                        }
                    }
                    
                    Section(header: Text("Albums")) {
                        ForEach(albums) { album in
                            Button(action: {
                                navigationPath.append(album)
                            }) {
                                Text(album.title)
                            }
                        }
                    }
                }
                .navigationDestination(for: Song.self) { song in
                    SongDetailView(song: song, navigationPath: $navigationPath)
                }
                .navigationDestination(for: Album.self) { album in
                    AlbumDetailView(album: album)
                }
                
                HStack {
                    Button("Add Album") {
                        navigationPath.append("AddAlbum")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                    Button("Settings") {
                        navigationPath.append("Settings")
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .navigationDestination(for: String.self) { string in
                switch string {
                case "AddAlbum":
                    AddAlbumView()
                case "Settings":
                    SettingsView()
                default:
                    EmptyView()
                }
            }
            .navigationTitle("Library")
        }
    }
}
