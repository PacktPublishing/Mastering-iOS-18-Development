import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Task Title", text: $title)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                        .frame(height: 200)
                }
            }
            .navigationTitle("Add Task")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                let newTask = Task(title: title, description: description)
                TaskManager.shared.addTask(newTask)
                TaskManager.shared.loadTasks()
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
