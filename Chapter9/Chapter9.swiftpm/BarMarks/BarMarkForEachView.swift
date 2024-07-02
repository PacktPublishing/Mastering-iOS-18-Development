//
//  BarMarkForEachView.swift
//  Chapter9
//
//  Created by Avi Tsadok on 24/04/2024.
//

import SwiftUI
import Charts

struct BarMarkForEachView: View {
    let data: [Sales] = [
        Sales(itemType: "Apples", qty: 50),
        Sales(itemType: "Oranges", qty: 60),
        Sales(itemType: "Watermelons", qty: 30)
    ]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(data, id:\.id) { item in
                    BarMark(x: .value("Fruit", item.itemType), y: .value("qty", item.qty))
                }
            }
        }
    }
}

#Preview {
    BarMarkForEachView()
}
