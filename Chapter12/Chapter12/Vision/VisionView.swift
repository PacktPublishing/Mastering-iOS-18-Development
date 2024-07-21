import SwiftUI

struct VisionView: View {
    var body: some View {
        List {
            NavigationLink("Barcode") {
                BarcodeScanningView()
            }
            NavigationLink("Face detection", destination: FaceDetectionView())
        }
        
    }
    

}

#Preview {
    VisionView()
}
