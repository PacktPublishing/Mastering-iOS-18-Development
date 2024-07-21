import SwiftUI
import NaturalLanguage

struct NearestNeighborsView: View {
    @State private var inputWord: String = ""
    @State private var neighborsText: String = "Top 5 neighbors will be displayed here"
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter a word here", text: $inputWord)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: findNeighbors) {
                Text("Find Neighbors")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Text(neighborsText)
                .padding()
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
    }
    
    func findNeighbors() {
        guard let embedding = NLEmbedding.wordEmbedding(for: .english) else { return }
        
        let neighbors = embedding.neighbors(for: embedding.vector(for: inputWord.lowercased()) ?? [], 
                                            maximumCount: 5)
        neighborsText = neighbors.map{ "\($0.0)"}.joined(separator: "\n")
        if neighbors.isEmpty {
            neighborsText = "No neighbors found for '\(inputWord)'."
        } else {
            neighborsText = neighbors.map{ "\($0.0)"}.joined(separator: "\n")
        }
    }
}

struct NearestNeighborsView_Previews: PreviewProvider {
    static var previews: some View {
        NearestNeighborsView()
    }
}
