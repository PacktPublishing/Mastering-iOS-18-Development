import SwiftUI

struct ConfirmationDialogView: View {
    @State private var isConfirmationDialogShows = false
    
    var body: some View {
        Button("Open Confirmation Dialog") {
            isConfirmationDialogShows = true
        }
        .confirmationDialog("Select source", isPresented: $isConfirmationDialogShows) {
            Button("Gallery")  {
                openGallery()
            }
            Button("Camera") {
                openCamera()
            }
            Button("Files") {
                openFiles()
            }
        }
    }
    
    private func openGallery() {
        
    }
    
    private func openCamera() {
        
    }
    
    private func openFiles() {
        
    }
}

#Preview {
    ConfirmationDialogView()
}
