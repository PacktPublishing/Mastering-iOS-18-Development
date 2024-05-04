//
//  PointMarkView.swift
//  Chapter12
//
//  Created by Avi Tsadok on 28/04/2024.
//

import SwiftUI
import Charts

struct StudentData: Identifiable {
    var id: UUID = UUID()
    var hoursStudied: Double
    var examScore: Double
}

let studentDataSet: [StudentData] = [
    StudentData(hoursStudied: 1.7, examScore: 61.8),
    StudentData(hoursStudied: 7.9, examScore: 78.6),
    StudentData(hoursStudied: 4.1, examScore: 44.3),
    StudentData(hoursStudied: 4.7, examScore: 63.4),
    StudentData(hoursStudied: 7.8, examScore: 90.4),
    StudentData(hoursStudied: 8.6, examScore: 83.2),
    StudentData(hoursStudied: 2.8, examScore: 29.7),
    StudentData(hoursStudied: 6.3, examScore: 72.9),
    StudentData(hoursStudied: 6.4, examScore: 73.8),
    StudentData(hoursStudied: 6.1, examScore: 77.6)
]



struct PointMarkView: View {
    var body: some View {
        VStack {
            Spacer()
            Chart(studentDataSet) {
                PointMark(x: .value("hours", $0.hoursStudied),
                          y: .value("score", $0.examScore))
            }
            .frame(height:400)
            Spacer()
        }
        
    }
}

#Preview {
    PointMarkView()
}
