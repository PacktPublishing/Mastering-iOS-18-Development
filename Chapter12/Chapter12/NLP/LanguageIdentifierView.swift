import SwiftUI
import NaturalLanguage

struct LanguageIdentifierView: View {
    @State private var inputText: String = ""
    @State private var identifiedLanguage: String = "Language will be displayed here"
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter text here", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: identifyLanguage) {
                Text("Identify Language")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Text(identifiedLanguage)
                .padding()
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
    }
    
    func identifyLanguage() {
        let tagger = NLTagger(tagSchemes: [.language])
        tagger.string = inputText
        
        if let language = tagger.dominantLanguage {
            identifiedLanguage = Locale.current.localizedString(forLanguageCode: language.rawValue) ?? "Unknown"
        } else {
            identifiedLanguage = "Unknown"
        }
    }
}

#Preview {
    LanguageIdentifierView()
}
