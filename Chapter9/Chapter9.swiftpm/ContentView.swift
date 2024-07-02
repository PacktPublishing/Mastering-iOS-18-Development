import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink(destination:BarMarkView()) {
                    Text("BarMark")
                }
                NavigationLink(destination:BarMarkForEachView()) {
                    Text("BarMark with ForEach")
                }
                NavigationLink(destination:StackedBarMarkView()) {
                    Text("Stacked Bar Mark")
                }
                NavigationLink(destination:BarMark1DView()) {
                    Text("1D Bar View")
                }
                NavigationLink(destination:IntervalBarMarks()) {
                    Text("Interval Bar View")
                }
                NavigationLink(destination:LineMarkView()) {
                    Text("Line Mark View")
                }
                NavigationLink(destination:SectorMarkView()) {
                    Text("Sector Mark View")
                }
                NavigationLink(destination:AreaMarkView()) {
                    Text("Area Mark View")
                }
                NavigationLink(destination:PointMarkView()) {
                    Text("Point Mark View")
                }
                NavigationLink(destination:ChartProxyExample()) {
                    Text("Chart Proxy Example")
                }
                NavigationLink(destination: LinePlotView()) {
                    Text("Line Plot Example (function-based chart)")
                }
                
                
            }

        })

    }
}
