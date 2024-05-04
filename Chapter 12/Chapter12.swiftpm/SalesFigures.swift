//
//  SalesFigures.swift
//  Chapter12
//
//  Created by Avi Tsadok on 28/04/2024.
//

import Foundation

struct SalesFigure: Identifiable {
    var id: UUID = UUID()
    let product: String
    let day: Date
    let amount: Double
}
