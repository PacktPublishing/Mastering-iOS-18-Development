//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by Avi Tsadok on 10/01/2024.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        ConfigurableWidget()
    }
}
