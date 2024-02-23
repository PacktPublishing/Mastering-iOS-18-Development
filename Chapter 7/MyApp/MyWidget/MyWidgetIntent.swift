//
//  MyWidgetIntent.swift
//  MyApp
//
//  Created by Avi Tsadok on 22/01/2024.
//

import Foundation
import AppIntents

struct MyWidgetIntent: AppIntent {
    init() {
        
    }
    var eventID: String = ""

    init(eventID: String) {
        self.eventID = eventID
    }
    
    static var title: LocalizedStringResource = "Adding interactivity to our widgets"
        
    func perform() async throws -> some IntentResult {
        let isAlarm = UserDefaults(suiteName: "group.com.packtapps.www")?.bool(forKey: "MyAlarm")
        let newAlarm = (isAlarm ?? true) ? false : true
        UserDefaults(suiteName: "group.com.packtapps.www")?.setValue(newAlarm, forKey: "MyAlarm")
        return .result()
    }    
}
