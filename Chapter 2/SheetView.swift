import SwiftUI
struct SheetView: View {
    
    @State private var isShowingSheet = false
    @State var selectedDetent: PresentationDetent = .medium
    
    var body: some View {
        VStack {
            Button(action: {
                isShowingSheet.toggle()
            }) {
                Text("Open Sheet")
            }.sheet(isPresented: $isShowingSheet, content: {
                VStack {
                    Button(selectedDetent == .medium ? "Expand" : "Collapse") {
                        selectedDetent =  selectedDetent == .medium ? .large : .medium
                    }.foregroundColor(.black)
                }
                    .presentationDetents([.medium,  .large], selection: $selectedDetent)
            })
            Spacer()
        }
    }
}

struct FlightDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Flight Details")
                .font(.title)
                .bold()
            
            Divider()
            
            DetailRow(title: "Flight Number", value: "XYZ123")
            DetailRow(title: "Departure", value: "New York")
            DetailRow(title: "Departure Time", value: "10:00 AM")
            DetailRow(title: "Arrival", value: "Los Angeles")
            DetailRow(title: "Arrival Time", value: "2:00 PM")
        }
        .padding()
    }
}

private struct MinDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        max(100, context.maxDetentValue * 0.2)
    }
}

extension PresentationDetent {
    static let min = Self.custom(MinDetent.self)
}


struct DetailRow: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            Text(value)
                .font(.subheadline)
        }
    }
}

#Preview {
    SheetView()
}
