import AppIntents

struct GetTasksListIntent: AppIntent {

    static var title: LocalizedStringResource { "Get my Tasks's List" }
    
    @MainActor
    func perform() async throws -> some ShowsSnippetView & ReturnsValue<Int> {
        let tasks = TaskManager.shared.tasks
        return .result(value: tasks.count, view: MiniTasksList(tasks: tasks))
    }
}



