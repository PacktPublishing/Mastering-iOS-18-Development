import AppIntents


struct AddTaskIntent: AppIntent {

    static var title: LocalizedStringResource { "Create new task" }
    
    @Parameter(title: "Title")
    var title: String
    
    @MainActor
    func perform() async throws -> some ReturnsValue<Task> {
        let newTask = Task(title: title)
        TaskManager.shared.addTask(newTask)
        return .result(value: newTask)
    }
}

