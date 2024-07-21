import SwiftUI
import Vision

struct BarcodeScanningView: View {
    
    @State var barcodeIdentifier: String = ""
    var body: some View {
        VStack {
            Image("barcode")
            Button("Analyze") {
                Task {
                    if let url = Bundle.main.url(forResource: "barcode", withExtension: "jpg") {
                        await analyze(url: url)

                    }
                }
            }
            Text(barcodeIdentifier)
        }
    }
    
    func analyze(url: URL) async {
        let request = DetectBarcodesRequest()
        do {
            let barcodeObservations = try await request.perform(on: url)
            barcodeIdentifier = barcodeObservations.first?.payloadString ?? ""
        } catch let error {
            print("error analyzing image - \(error.localizedDescription)")
        }
    }
}

#Preview {
    BarcodeScanningView()
}
