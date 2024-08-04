//
//  ContentView.swift
//  GroupSubviewsDemo
//
//  Created by Avi Tsadok on 03/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView {
            VStack {
                Text("Latest headlines")
                    .font(.title)
                
                Group(subviews: NewsView()) { collection in
                    if let firstHeadline = collection.first {
                        firstHeadline
                            .font(.title2)
                        Spacer()
                    }
                    ForEach(collection.dropFirst()) { newsItem in
                        newsItem
                            .font(.headline)
                        Spacer()
                    }
                }
            }
            .padding()
        }
    }
}


struct NewsView: View {
    var body: some View {
        Text("Major Breakthrough in Renewable Energy: New Solar Panel Technology Promises 30% Efficiency Increase")
        Text("lobal Markets React to Sudden Interest Rate Hike: Stocks Tumble Across the Board")
        Text("Historic Peace Agreement Reached: Leaders Sign Pact to End Decades-Long Conflict")
        Text("Innovative AI Tool Revolutionizes Healthcare: Doctors Embrace Machine Learning for Diagnosis")
        Text("Natural Disaster Strikes: Massive Earthquake Hits Coastal City, Rescue Efforts Underway")
    }
}

#Preview {
    ContentView()
}
