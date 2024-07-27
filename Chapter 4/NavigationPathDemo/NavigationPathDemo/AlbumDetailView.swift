import SwiftUI

struct AlbumDetailView: View {
    let album: Album
    
    var body: some View {
        Text("Detail view for \(album.title)")
            .navigationTitle(album.title)
    }
}
