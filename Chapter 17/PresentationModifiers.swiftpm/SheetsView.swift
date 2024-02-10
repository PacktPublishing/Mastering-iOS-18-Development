//
//  SheetsView.swift
//  PresentationModifiers
//
//  Created by Avi Tsadok on 10/02/2024.
//

import SwiftUI

struct SheetsView: View {
    
    @State private var showBasicSheet = false
    @State private var preDefinedSheet = false
    @State private var fractionSheetSize = false
    @State private var specificHeightSheetSize = false
    @State private var customPresentationDetent = false
    
    var body: some View {
        List {
            Button(action: {
                showBasicSheet = true
            }) {
                Text("Basic Sheet")
            }.sheet(isPresented: $showBasicSheet, content: {
                FlightDetailsView()
            })

            Button(action: {
                preDefinedSheet = true
            }) {
                Text("Pre-defined sheet size")
            }.sheet(isPresented: $preDefinedSheet, content: {
                FlightDetailsView()
                    .presentationDetents([.medium, .large])
            })
            
            Button(action: {
                fractionSheetSize = true
            }) {
                Text("Fraction sheet size")
            }.sheet(isPresented: $fractionSheetSize, content: {
                FlightDetailsView()
                    .presentationDetents([.fraction(0.1), .fraction(0.5), .large])
            })
            
            Button(action: {
                specificHeightSheetSize = true
            }) {
                Text("Specific height sheet size")
            }.sheet(isPresented: $specificHeightSheetSize, content: {
                FlightDetailsView()
                    .presentationDetents([.height(100), .medium, .large])
            })
            
            
            Button(action: {
                customPresentationDetent = true
            }) {
                Text("Specific height sheet size")
            }.sheet(isPresented: $customPresentationDetent, content: {
                FlightDetailsView()
                    .presentationDetents([.height(100), .medium, .large]).presentationDetents([.custom(MinDetent.self), .large])
            })

        }
    }
}

struct FlightDetailsView: View {
    var body: some View {
        Text("Some flight information")
    }
}


private struct MinDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        max(100, context.maxDetentValue * 0.2)
    }
}


#Preview {
    SheetsView()
}
