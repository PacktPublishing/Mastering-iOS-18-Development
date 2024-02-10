//
//  AlertsView.swift
//  PresentationModifiers
//
//  Created by Avi Tsadok on 10/02/2024.
//

import SwiftUI

struct AlertsView: View {
    
    @State private var isShowAlert = false
    
    @State private var isShowTextFieldAndMessage = false
    @State private var password = ""
    
    @State private var isShowConfirmationDialog = false
    
    var body: some View {
        List {
            Button(action:{
                isShowAlert = true
            }) {
                Text("Basic Alert")
            }
            .alert("Hi, you have a memory leak!",
                    isPresented: $isShowAlert) {
                Button("OK", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            }
            
            Button(action: {
                isShowTextFieldAndMessage = true
            }) {
                Text("Adding text fields and a message")
            }
            .alert("Authentication Alert",
                   isPresented: $isShowTextFieldAndMessage) {
                SecureField("Password", text: $password)
                Button("OK", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please fill your password to continue")
            }

            
            Button(action: {
                isShowConfirmationDialog = true
            }) {
                Text("Inserting confirmationDialog")
            }.confirmationDialog("Select source", isPresented: $isShowConfirmationDialog) {
                
                Button("Gallery") {
                    openImageGallery()
                }
                
                Button("Camera") {
                    openDeviceCamera()
                }
                
                Button("Files") {
                    openFilesBrowser()
                }

            }

        }
    }
}
                       
func openImageGallery() {

}

func openFilesBrowser() {

}

func openDeviceCamera() {

}

#Preview {
    AlertsView()
}
