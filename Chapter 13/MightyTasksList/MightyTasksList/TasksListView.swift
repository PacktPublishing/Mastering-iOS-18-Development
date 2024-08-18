import SwiftUI

struct TaskListView: View {
    private var taskManager = TaskManager.shared
    @State private var showingAddTaskView = false
    @State var navigator = Navigator.shared
    
    var body: some View {
        NavigationStack(path: $navigator.path) {
            TasksList(taskManager: taskManager)
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: Button(action: {
                showingAddTaskView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddTaskView) {
                AddTaskView()
            }
            .navigationDestination(for: Task.self) { task in
                TaskDetailView(task: task)
            }
        }
    }
}

struct TasksList: View {
    
    let taskManager: TaskManager
    @State var navigator = Navigator.shared

    var body: some View {
        
        List {
            ForEach(taskManager.tasks) { task in
                    Text(task.title)
                        .onTapGesture {
                            navigator.path.append(task)
                        }
            }
        }
    }
}


struct MiniTasksList: View {
    let tasks: [Task]
    
    var body: some View {
        VStack {
            ForEach(tasks) { task in
                TaskView(task: task)
            }
        }
    }
}

struct TaskView: View {
    var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
                .font(.headline)
            if !task.description.isEmpty {
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

