import SwiftUI



struct MiniTaskView: View {
    
    let task: Task
    
    var body: some View {
        VStack {
            Text(task.title)
                .font(.title)
            Text(task.description)
                .font(.title2)
        }
    }
}
