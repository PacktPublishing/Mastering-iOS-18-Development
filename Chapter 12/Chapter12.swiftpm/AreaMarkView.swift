//
//  AreaMarkView.swift
//  Chapter12
//
//  Created by Avi Tsadok on 27/04/2024.
//

import SwiftUI
import Charts

struct AreaMarkView: View {
    
    let salesFigures: [SalesFigure] = [
        SalesFigure(product: phoneProduct, day: Date(timeIntervalSince1970: 1714078800), amount: 100),
        SalesFigure(product: tabletProduct, day: Date(timeIntervalSince1970: 1714078800), amount: 70),
        SalesFigure(product: phoneProduct, day: Date(timeIntervalSince1970: 1714165200), amount: 120),
        SalesFigure(product: tabletProduct, day: Date(timeIntervalSince1970: 1714165200), amount: 90),
        SalesFigure(product: phoneProduct, day: Date(timeIntervalSince1970: 1714251600), amount: 90),
        SalesFigure(product: tabletProduct, day: Date(timeIntervalSince1970: 1714251600), amount: 98),
        SalesFigure(product: phoneProduct, day: Date(timeIntervalSince1970: 1714338000), amount: 70),
        SalesFigure(product: tabletProduct, day: Date(timeIntervalSince1970: 1714338000), amount: 110)
    ]
    
    var body: some View {
        Chart(salesFigures) { data in
            AreaMark(
                x: .value("Date", data.day),
                y: .value("Sales", data.amount)
            )
            .foregroundStyle(by: .value("Product", data.product))            
        }
    }
}

#Preview {
    AreaMarkView()
}
