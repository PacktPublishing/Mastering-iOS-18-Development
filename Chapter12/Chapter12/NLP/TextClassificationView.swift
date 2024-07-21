import SwiftUI
import NaturalLanguage

struct TextClassificationView: View {
    @State private var userInput: String = ""
    @State private var sentimentScore: String = "Enter text to analyze sentiment"
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter text", text: $userInput, onEditingChanged: { _ in
                self.analyzeSentiment()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Text(sentimentScore)
                .font(.headline)
                .padding()
            
            Spacer()
        }
        .padding()
    }
    
    func analyzeSentiment() {
        let sentimentAnalyzer = NLTagger(tagSchemes: [.sentimentScore])
        sentimentAnalyzer.string = userInput
        
        let (sentiment, _) = sentimentAnalyzer.tag(at: userInput.startIndex, unit: .paragraph, scheme: .sentimentScore)
        if let sentiment = sentiment, let score = Double(sentiment.rawValue) {
            sentimentScore = String(format: "Sentiment score: %.2f", score)
        } else {
            sentimentScore = "Unable to analyze sentiment"
        }
    }
}

#Preview {
    TextClassificationView()
}
