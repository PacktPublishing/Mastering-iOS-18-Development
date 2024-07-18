//
//  ContentView.swift
//  Chapter14
//
//  Created by Avi Tsadok on 02/07/2024.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Counter App")
                .font(.largeTitle)
                .padding()
            
            Text("\(viewModel.count)")
                .font(.system(size: 80, weight: .bold))
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            HStack(spacing: 40) {
                Button(action: {
                    viewModel.increment(by: 1)
                }) {
                    Text("Increment")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    viewModel.decrement(by: 1)
                }) {
                    Text("Decrement")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            Spacer()
            
            HStack {
                Button(action: {
                    viewModel.reset()
                }) {
                    Text("Reset")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    viewModel.saveCount()
                }) {
                    Text("Save Count")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
