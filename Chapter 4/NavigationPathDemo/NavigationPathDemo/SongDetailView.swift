import SwiftUI

struct SongDetailView: View {
    let song: Song
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack {
            Text("Detail view for \(song.title)")
            Button("Back") {
                navigationPath.removeLast()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .navigationTitle(song.title)
    }
}
