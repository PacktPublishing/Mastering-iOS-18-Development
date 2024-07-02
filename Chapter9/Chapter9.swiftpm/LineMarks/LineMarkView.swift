//
//  SwiftUIView.swift
//  
//
//  Created by Avi Tsadok on 26/04/2024.
//

import SwiftUI
import Charts



let phoneProduct = "Phone"
let tabletProduct = "Tablet"

struct LineMarkView: View {
    
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
        VStack {
            Spacer()
            Chart(salesFigures) {
                LineMark(
                    x: .value("time", $0.day),
                    y: .value("amount", $0.amount)
                )
                .foregroundStyle(by: .value("Product", $0.product))
            }.frame(height:400)
            Spacer()
        }
        
    }
}

#Preview {
    LineMarkView()
}
