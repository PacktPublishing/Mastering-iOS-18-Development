import SwiftUI


struct ContentView: View {
    
    @State private var showScrollToTop = false

    
    let albums: [Album] = [
        Album(title: "Album 1", artist: "Artist 1", coverImage: "cover1"),
        Album(title: "Album 2", artist: "Artist 2", coverImage: "cover2"),
        Album(title: "Album 3", artist: "Artist 3", coverImage: "cover3"),
        Album(title: "Album 4", artist: "Artist 4", coverImage: "cover4"),
        Album(title: "Album 5", artist: "Artist 5", coverImage: "cover5"),
        Album(title: "Album 6", artist: "Artist 6", coverImage: "cover1"),
        Album(title: "Album 7", artist: "Artist 7", coverImage: "cover2"),
        Album(title: "Album 8", artist: "Artist 8", coverImage: "cover3"),
        Album(title: "Album 9", artist: "Artist 9", coverImage: "cover4"),
        Album(title: "Album 10", artist: "Artist 10", coverImage: "cover5"),
        Album(title: "Album 11", artist: "Artist 11", coverImage: "cover1"),
        Album(title: "Album 12", artist: "Artist 12", coverImage: "cover2"),
        Album(title: "Album 13", artist: "Artist 13", coverImage: "cover3"),
        Album(title: "Album 14", artist: "Artist 14", coverImage: "cover4"),
        Album(title: "Album 15", artist: "Artist 15", coverImage: "cover5")
    ]
    
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(albums) { album in
                        ExtractedView(album: album)
                            .id(album.id)
                            .onScrollVisibilityChange(threshold: 0.9) { visible in
                                if visible {
                                    print("\(album.title) appears")
                                }
                                
                            }
                    }
                }
                .padding(.vertical)
                
            }
            .overlay(alignment: .bottom) {
                if showScrollToTop {
                    Button("Scroll to top") {
                        withAnimation {
                            proxy.scrollTo(albums[0].id, anchor: .top)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    
                }
            }
            .onScrollGeometryChange(for: Bool.self) { geometry in
                geometry.contentOffset.y < geometry.contentInsets.bottom + 300
                
            } action: { oldValue, newValue in
                withAnimation {
                    showScrollToTop = !newValue
                }
            }

        }

    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    
    let album:Album
    
    var body: some View {
        HStack {
            Image(album.coverImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text(album.title)
                    .font(.headline)
                Text(album.artist)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer() // To push the text to the left
        }
        .padding(.horizontal)
    }
}
