import SwiftUI
import CoreML

struct MessageClassifierView: View {
    @State private var message: String = ""
    @State private var result: String = ""
    @State private var model: MessageClassifier?
    
    var body: some View {
        VStack {
            TextField("Enter your message", text: $message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: classifyMessage) {
                Text("Classify")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            Text(result)
                .padding()
                .font(.headline)
        }
        .onAppear(perform: loadModel)
    }
    
    func loadModel() {
        do {
            let config = MLModelConfiguration()
            model = try MessageClassifier(configuration: config)
        } catch {
            print("Failed to load model: \(error)")
        }
    }
    
    func classifyMessage() {
        guard let model = model else {
            result = "Model not loaded"
            return
        }
        do {
            let prediction = try model.prediction(text: message)
            result = prediction  ? "Spam" : "Not Spam"            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}

struct MessageClassifierView_Previews: PreviewProvider {
    static var previews: some View {
        MessageClassifierView()
    }
}
