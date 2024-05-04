//
//  SectorMarkView.swift
//  Chapter12
//
//  Created by Avi Tsadok on 27/04/2024.
//

import SwiftUI
import Charts

struct FavoriteFruit: Identifiable {
    var id: UUID = UUID()
    let name: String
    let value: Double
}

struct SectorMarkView: View {
    let data: [FavoriteFruit] = [
        FavoriteFruit(name: "Apple", value: 30),
        FavoriteFruit(name: "Banana", value: 25),
        FavoriteFruit(name: "Orange", value: 20),
        FavoriteFruit(name: "Strawberries", value: 15),
        FavoriteFruit(name: "Grapes", value: 10)
    ]
    var body: some View {
        VStack {
            Spacer()
            Chart(data) {item in
                if #available(iOS 17.0, *) {
                    SectorMark(angle: .value("Value", item.value), innerRadius: 50)
                        .foregroundStyle(by: .value("Fruit", item.name))
                } else {
                    // Fallback on earlier versions
                }
            }.frame(height:300)
            Spacer()
        }

    }
}

#Preview {
    SectorMarkView()
}
