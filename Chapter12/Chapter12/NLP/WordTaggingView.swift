import SwiftUI
import NaturalLanguage

struct WordTaggingView: View {
    @State private var inputText: String = ""
    @State private var verb: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter a sentence", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: findVerb) {
                Text("Find Verb")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("Verb: \(verb)")
                .padding()
                .foregroundColor(.green)
        }
        .padding()
    }
    
    func findVerb() {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = inputText
        
        let options: NLTagger.Options =  [.omitPunctuation, .omitWhitespace]
        tagger.enumerateTags(in: inputText.startIndex..<inputText.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
            if tag == .verb {
                verb = String(inputText[tokenRange])
                return false
            }
            return true
        }
    }
}

#Preview {
    WordTaggingView()
}
