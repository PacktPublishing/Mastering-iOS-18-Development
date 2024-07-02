//
//  BarMarkView.swift
//  Chapter9
//
//  Created by Avi Tsadok on 23/04/2024.
//

import SwiftUI
import Charts

struct BarMarkView: View {
        
    let data: [Sales] = [
        Sales(itemType: "Apples", qty: 50),
        Sales(itemType: "Oranges", qty: 60),
        Sales(itemType: "Watermelons", qty: 30)
    ]
        
    var body: some View {
        VStack {
            Chart(data) {
                BarMark(
                    x: .value("Fruit", $0.itemType),
                    y: .value("qty", $0.qty)
                )
            }
        }
    }
}

#Preview {
    BarMarkView()
}
