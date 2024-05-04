//
//  ChartProxyExample.swift
//  Chapter12
//
//  Created by Avi Tsadok on 29/04/2024.
//

import SwiftUI
import Charts


struct ChartProxyExample: View {
    
    @State var markerX: CGFloat = 50
    
    let salesFigures: [SalesFigure] = [
        SalesFigure(product: tabletProduct, day: Date(timeIntervalSince1970: 1714078800), amount: 70),
        SalesFigure(product: tabletProduct, day: Date(timeIntervalSince1970: 1714165200), amount: 90),
        SalesFigure(product: tabletProduct, day: Date(timeIntervalSince1970: 1714251600), amount: 98),
        SalesFigure(product: tabletProduct, day: Date(timeIntervalSince1970: 1714338000), amount: 110)
    ]
    
    var body: some View {
        Chart(salesFigures){
            LineMark(
                x: .value("time", $0.day),
                y: .value("amount", $0.amount)
            )
            .symbol() {
                Circle()
                    .strokeBorder(.red, lineWidth: 2)
                    .background(Circle()
                        .foregroundColor(.white))
                    .frame(width: 11)
            }
            .foregroundStyle(by: .value("Product", $0.product))
        }
        .chartOverlay { proxy in
            ZStack(alignment: .topLeading) {
                    Rectangle().fill(.clear)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    markerX = value.location.x
                                    if let closestDate = getClosestDateForLocation(x: value.location.x, proxy: proxy) {
                                        if let positionX = proxy.position(forX: closestDate) {
                                            markerX = positionX
                                    }
                                }
                            }
                        )
                    let lineHeight = proxy.plotSize.height
                    Rectangle()
                        .fill(.red)
                        .frame(width: 2, height: lineHeight)
                        .position(x: markerX, y: lineHeight/2)
            }
        }
    }
    
    func getClosestDateForLocation(x: CGFloat, proxy: ChartProxy) -> Date? {
        var returnedSalesFigure: SalesFigure?
        if let date = proxy.value(atX: x) as Date? {
            var mDistance: TimeInterval = .infinity
            for salesFigure in salesFigures {
                let distance = abs(salesFigure.day.distance(to: date))
                if distance < mDistance {
                    returnedSalesFigure = salesFigure
                    mDistance = distance
                }
            }
        }
        return returnedSalesFigure?.day
    }
}


#Preview {
    ChartProxyExample()
}
