import SwiftUI
import SoundAnalysis

struct SoundAnalysisView: View {
    @State var soundDescription: String = ""
    var body: some View {
        VStack {
            Button("Analyse") {
                if let soundFileURL = Bundle.main.url(forResource: "baby_cry", withExtension: "wav") {
                    analyze(at: soundFileURL)
                }
            }
            Text(soundDescription)
        }
    }
    
    func analyze(at url: URL) {
        do {
            let audioFileAnalyzer = try SNAudioFileAnalyzer(url: url)
            let request = try SNClassifySoundRequest(classifierIdentifier: .version1)
            
            let resultsObserver = ClassificationResultsObserver()
            resultsObserver.response = { description in
                soundDescription = description
            }
            try audioFileAnalyzer.add(request, withObserver: resultsObserver)
            
            audioFileAnalyzer.analyze()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

class ClassificationResultsObserver: NSObject, SNResultsObserving {
    
    var response: (String)->Void = { _ in }
    
    func request(_ request: SNRequest, didProduce result: SNResult) {
        guard let result = result as? SNClassificationResult else { return }
        
        if let classification = result.classifications.first {
            response(classification.identifier)
        }
    }
    
    func request(_ request: SNRequest, didFailWithError error: Error) {
        print("Failed with error: \(error.localizedDescription)")
    }
    
    func requestDidComplete(_ request: SNRequest) {
        print("Request did complete")
    }
}

#Preview {
    SoundAnalysisView()
}
