//
//  MyWidget.swift
//  MyWidget
//
//  Created by Avi Tsadok on 10/01/2024.
//

import WidgetKit
import SwiftUI


struct EventEntry: TimelineEntry {
    let date: Date
    let nextEvent: String
    var relevance: TimelineEntryRelevance?
    var isAlarm: Bool = false
}





struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), nextEvent: "Pick up the kids", nextEventTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!, eventID: "", isAlarm: true)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), nextEvent: "Pick up the kids", nextEventTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!, eventID: "", isAlarm: true)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let isAlarm = UserDefaults(suiteName: "group.com.packtapps.www")?.bool(forKey: "MyAlarm") ?? false
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, nextEvent: "Pick up the kids", nextEventTime: Calendar.current.date(byAdding: .hour, value: 1, to: entryDate)!, eventID: "", isAlarm: isAlarm)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let nextEvent: String
    let nextEventTime: Date
    let eventID: String
    let isAlarm: Bool
}

struct MyWidgetEntryView : View {
    var entry: Provider.Entry

    @State var testBool: Bool = false
    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.nextEventTime, style: .time)
            Text("Next Event")
            Button("Turn \(entry.isAlarm ? "Off" : "On") Alarm"  , role: nil, intent: MyWidgetIntent(eventID: entry.eventID))
            
            Text(entry.nextEvent)
                .contentTransition(.numericText())
                .widgetURL(URL(string: "https://www.myGreatCalendarApp.com/event/\(entry.eventID)/"))            
        }
    }
}

struct MyWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemMedium) {
    MyWidget()
} timeline: {
    SimpleEntry(date: Date(), nextEvent: "Do the laundry", nextEventTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!, eventID: "", isAlarm: false)
    SimpleEntry(date: Date(), nextEvent: "Pick up the kids", nextEventTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!, eventID: "", isAlarm: true)
}
