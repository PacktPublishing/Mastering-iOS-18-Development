import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        ConfigurableWidget()
        MaindoorControl()
    }
}
