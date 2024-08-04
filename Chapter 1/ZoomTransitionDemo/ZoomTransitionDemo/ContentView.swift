import SwiftUI

struct ContentView: View {
        
    @Namespace() var namespace

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [ GridItem(.adaptive(minimum: 150)) ]) {
                    
                    ForEach(Album.albums) { album in
                        NavigationLink {
                            Image(album.imageName)
                                .resizable()
                                .navigationTransition(.zoom(sourceID: album.id, in: namespace))
                        } label: {
                            Image(album.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 150)
                                .cornerRadius(8.0)
                        }
                        .matchedTransitionSource(id: album.id, in: namespace)
                        
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
