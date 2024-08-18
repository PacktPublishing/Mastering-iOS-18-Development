import AppIntents

struct DeleteAllTasksIntent: AppIntent {
    static var title: LocalizedStringResource { "Delete all tasks" }
    
    func perform() async throws -> some ProvidesDialog {
        
        let taskManager = TaskManager.shared
        if taskManager.tasks.count == 0 {
            return .result(dialog: .init("Forry, there are no tasks to delete"))
        }
        
        try await requestConfirmation(actionName: .go, dialog: IntentDialog("Are you sure you want to delete all of your tasks?"))
                                                         
        TaskManager.shared.deleteAllTasks()
        return .result(dialog: .init("All of your tasks have been deleted."))
    }
}
