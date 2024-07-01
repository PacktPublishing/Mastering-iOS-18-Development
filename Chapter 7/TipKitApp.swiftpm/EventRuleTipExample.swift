//
//  EventRuleTipExample.swift
//  TipKitApp
//
//  Created by Avi Tsadok on 17/03/2024.
//

import SwiftUI
import TipKit

struct AddListTip: Tip {
    var title: Text { Text("Adding tasks to lists")}
    
    var message: Text? { Text("You can create a list that holds your new tasks") }
    
    var id: String { "AddListTip" }
    
    static let didAddATaskEvent = Event(id: "didAddATaskEvent")
    
    var rules: [Rule] {
        #Rule(Self.didAddATaskEvent) {
            $0.donations.count > 3
        }
    }
    
    var options: [TipOption] {
        Tips.IgnoresDisplayFrequency(true)
    }
    
}

struct Todo: Identifiable {
    var id = UUID()
    let title: String
}

struct EventRuleTipExample: View {
    
    let tip = AddListTip()
    @State var todos: [Todo] = []
    
    var body: some View {
        VStack {
            TipView(tip)
            List(todos) { todo in
                Text(todo.title)
            }
            Spacer()
            Button("Add task") {
                todos.append(Todo(title: "New Task"))
                Task{ await AddListTip.didAddATaskEvent.donate()}
            }
        }
    }
}

#Preview {
    EventRuleTipExample()
}
