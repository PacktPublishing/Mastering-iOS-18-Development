import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(album.title)
                .font(.largeTitle)
                .padding(.bottom, 5)
            Text(album.artist)
                .font(.title)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle(album.title)
    }
}
