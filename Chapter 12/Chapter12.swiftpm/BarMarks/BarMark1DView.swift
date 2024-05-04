//
//  BarMark1DView.swift
//  Chapter12
//
//  Created by Avi Tsadok on 25/04/2024.
//

import SwiftUI
import Charts

struct BarMark1DView: View {
    
    let data: [Sales] = [
        Sales(itemType: "Apples", qty: 20, fruitColor: "Green"),
        Sales(itemType: "Apples", qty: 30, fruitColor: "Red"),
        Sales(itemType: "Apples", qty: 40, fruitColor: "Yellow"),
    ]
    
    var body: some View {
        VStack {
            Spacer()
            Chart(data) {
                BarMark(
                    x: .value("Qty", $0.qty)
                )
                .foregroundStyle(by: .value("Color", $0.fruitColor))    
            }
            .chartForegroundStyleScale(["Green" : Color.green, "Red" : Color.red, "Yellow" : Color.yellow])
            .frame(height: 100)
            Spacer()
        }
        
    }
}

#Preview {
    BarMark1DView()
}
