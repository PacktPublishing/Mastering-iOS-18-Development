import Foundation
import AppIntents


struct CalendarWidgetIntent: WidgetConfigurationIntent {
    init() {
        calendar = CalendarEntity(id: "0", name: "No next event")
    }
            
    static var title: LocalizedStringResource = "Select Calendar"
    
    @Parameter(title: "Calendar") var calendar: CalendarEntity
    init(calendar: CalendarEntity) {
        self.calendar = calendar
    }
}



struct CalendarEntity: AppEntity {
    let id: String
    let name: String
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Calendar"
    static var defaultQuery = CalendarQuery()
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(name)")
    }
}

let allCalendars: [CalendarEntity] = [
    CalendarEntity(id: "1", name: "Personal"),
    CalendarEntity(id: "2", name: "Work"),
    CalendarEntity(id: "3", name: "Family")
]

struct CalendarQuery: EntityQuery {
    
    func entities(for identifiers: [CalendarEntity.ID]) async throws -> [CalendarEntity] {
        allCalendars.filter { identifiers.contains($0.id) }
    }
    
    func suggestedEntities() async throws -> [CalendarEntity] {
        allCalendars
    }
    
    func defaultResult() async -> CalendarEntity? {
        nil
    }
}
