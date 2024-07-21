import CoreML

class MessageClassifier {
    let model: MLModel
    
    init(configuration: MLModelConfiguration = MLModelConfiguration()) throws {
        model = try SpamClassifier(configuration: configuration).model
    }
    
    func prediction(text: String) throws -> Bool {
        let input = SpamClassifierInput(text: text)
        if let result =  try? model.prediction(from: input) {
            let value = result.featureValue(for: "label")!.stringValue
            return value == "true"
        }
        return false
    }
}
