//
//  LinePlotView.swift
//  Chapter9
//
//  Created by Avi Tsadok on 28/06/2024.
//

import SwiftUI
import Charts

struct LinePlotView: View {
    var body: some View {
        VStack {
            Spacer()
            Chart {
                AreaPlot(x:"x", y:"y") { x in
                    return sin(x)
                }
            }
            .frame(height:400)
            Spacer()
        }

        

    }
}

#Preview {
    LinePlotView()
}
