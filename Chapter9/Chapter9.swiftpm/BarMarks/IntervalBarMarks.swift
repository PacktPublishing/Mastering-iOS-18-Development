//
//  IntervalBarMarks.swift
//
//
//  Created by Avi Tsadok on 26/04/2024.
//

import SwiftUI
import Charts


let emma = "Emma Johnson"
let liam = "Liam Patel"
let sophia = "Sophia Garcia"

struct EmployeDayWork: Identifiable {
        var id: UUID = UUID()
        let name: String
        let startTime: Double
        let endTime: Double
    }

struct IntervalBarMarks: View {
    

    
    let data: [EmployeDayWork] = [
        EmployeDayWork(name:emma, startTime: 10, endTime: 12),
        EmployeDayWork(name:liam, startTime: 8, endTime: 11),
        EmployeDayWork(name: sophia, startTime: 10.5, endTime: 11.5),
        EmployeDayWork(name: emma, startTime: 14, endTime: 15),
        EmployeDayWork(name: liam, startTime: 13.5, endTime: 14.2),
        EmployeDayWork(name: sophia, startTime: 15, endTime: 16)
    ]
    
    var body: some View {
        VStack {
            Spacer()
            Chart(data) {
                BarMark(
                    xStart: .value("Start", $0.startTime),
                    xEnd: .value("End", $0.endTime),
                    y: .value("Employee", $0.name)
                )
            }
            .frame(height:100)
            Spacer()
        }
    }
}

#Preview {
    IntervalBarMarks()
}
