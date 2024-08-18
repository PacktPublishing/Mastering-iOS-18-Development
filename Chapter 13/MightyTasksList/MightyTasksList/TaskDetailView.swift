import SwiftUI

struct TaskDetailView: View {
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
                .font(.largeTitle)
                .padding(.bottom, 10)
            Text(task.description)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle("Task Detail")
    }
}
