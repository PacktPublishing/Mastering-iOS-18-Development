import SwiftUI
import Vision

struct FaceDetectionView: View {
    @State var rect: String = ""
    var body: some View {
        VStack {
            Image(uiImage: UIImage(contentsOfFile: Bundle.main.url(forResource: "people", withExtension: "jpg")!.path(percentEncoded: true))!)
            Button("Analyze") {
                Task {
                    if let url = Bundle.main.url(forResource: "people", withExtension: "jpg")  {
                        await analyze(url: url)
                    }
                    
                }
            }
            Text(rect)
        }
    }
    
    func analyze(url: URL) async {
        let request = DetectFaceRectanglesRequest()
                
        do {
            let observations = try await request.perform(on: url)
            if let observation = observations.first {
                rect = observation.description
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    FaceDetectionView()
}
