import WidgetKit
import SwiftUI

struct ConfigurableProvider: AppIntentTimelineProvider {

    func placeholder(in context: Context) ->  ConfiguredNextEventEntry {
        ConfiguredNextEventEntry(title: "", date: Date(), configuration: CalendarWidgetIntent())
    }
    
    func snapshot(for configuration: CalendarWidgetIntent, in context: Context) async ->  ConfiguredNextEventEntry {
        ConfiguredNextEventEntry(title: "", date: Date(), configuration: CalendarWidgetIntent())
    }
    
    
    func timeline(for configuration: CalendarWidgetIntent, in context: Context) async -> Timeline<ConfiguredNextEventEntry> {
        var entries: [ConfiguredNextEventEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = ConfiguredNextEventEntry(title: "Pick up the kids", date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
}

struct ConfiguredNextEventEntry: TimelineEntry {
    let title: String
    let date: Date
    let configuration: CalendarWidgetIntent
}

struct ConfigurableWidgetView: View {
    
    let entry: ConfiguredNextEventEntry
    
    var body: some View {
        VStack {
            Text(entry.title)
            Text(entry.configuration.calendar?.name ?? "")
        }
    }
}


struct ConfigurableWidget: Widget {
    let kind: String = "ConfigurableWidget"
        
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: CalendarWidgetIntent.self, provider: ConfigurableProvider(), content: { entry in
            ConfigurableWidgetView(entry: entry)
        })
    }
}
