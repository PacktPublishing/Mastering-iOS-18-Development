import SwiftUI

struct NLPView: View {
    var body: some View {
        List {
            NavigationLink("Text classification") {
                TextClassificationView()
            }
            NavigationLink("Word Tagging") {
                WordTaggingView()
            }
            NavigationLink("Language Identifier") {
                LanguageIdentifierView()
            }
            NavigationLink("Word Embedding") {
                NearestNeighborsView()
            }
        }
    }
}
