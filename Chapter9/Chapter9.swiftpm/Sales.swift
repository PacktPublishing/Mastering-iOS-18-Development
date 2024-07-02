//
//  Sales.swift
//  Chapter9
//
//  Created by Avi Tsadok on 24/04/2024.
//

import Foundation
import Charts

struct Sales: Identifiable {
    var id: UUID = UUID()
    let itemType: String
    let qty: Int
    var fruitColor: String = ""
}


enum FruitType: String {
    case Apples
    case Oranges
    case Watermelons
}

extension FruitType: Plottable {
    var primitivePlottable: String {
        rawValue
    }
}
