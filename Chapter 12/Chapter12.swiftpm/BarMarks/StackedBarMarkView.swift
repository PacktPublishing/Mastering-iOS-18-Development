//
//  StackedBarMarkView.swift
//  Chapter12
//
//  Created by Avi Tsadok on 24/04/2024.
//

import SwiftUI
import Charts

struct StackedBarMarkView: View {
    
    let data: [Sales] = [
        Sales(itemType: "Apples", qty: 20, fruitColor: "Green"),
        Sales(itemType: "Apples", qty: 30, fruitColor: "Red"),
        Sales(itemType: "Oranges", qty: 60),
        Sales(itemType: "Watermelons", qty: 30)
    ]
    
    var body: some View {
        Chart(data) {
            BarMark(x: .value("Fruit", $0.itemType), 
                    y: .value("qty", $0.qty))
                .foregroundStyle(by: .value("Color", $0.fruitColor))
        }
    }
}

#Preview {
    StackedBarMarkView()
}
