import Combine
import Foundation
import Observation

@Observable
class TaskManager {
    static let shared = TaskManager()
    var tasks: [Task] = []
    private let tasksKey = "tasks"
    
    init() {
        loadTasks()
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func loadTasks() {
        
        if tasks.isEmpty {
            tasks = [
                Task(title: "Sample Task 1", description: "Description for sample task 1"),
                Task(title: "Sample Task 2", description: "Description for sample task 2"),
                Task(title: "Sample Task 3", description: "Description for sample task 3")
            ]
        }
    }

    
    
    func getTasksFileURL() -> URL? {
        let fileManager = FileManager.default
        do {
            let documentsURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            return documentsURL.appendingPathComponent("tasks.json")
        } catch {
            print("Error getting file URL: \(error)")
            return nil
        }
    }

    
    func deleteAllTasks() {
        
    }
}
