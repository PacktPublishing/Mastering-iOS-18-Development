import AppIntents


struct OpenTaskIntent: AppIntent {
    static var title: LocalizedStringResource { "Open a task" }
    
    @Parameter(title: "Task")
    var task: Task?
    
    static let openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some ProvidesDialog{
        let taskToOpen: Task
        
        if let task {
            taskToOpen = task
        } else {
            taskToOpen = try await $task.requestDisambiguation(
                among: TaskManager.shared.tasks,
                dialog: "What task would like to open?")
        }
        
        Navigator.shared.path.append(taskToOpen)
        
        return .result(dialog: "Opening your task")
    }
}
