import WidgetKit
import SwiftUI


struct MaindoorControl: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.avitsadok.MaindoorControl"
        ) {            
            ControlWidgetToggle(
                "Main door control",
                isOn: HouseManager.shared.isOpen,
                action: MaindoorIntent()
            ) { isOn in
                Label(isOn ? "Opened" : "Closed",
                      systemImage: isOn ? "door.left.hand.open" : "door.left.hand.closed")
            }
        }
    }
}
