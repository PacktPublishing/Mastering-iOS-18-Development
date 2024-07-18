import Foundation

class CounterViewModel: ObservableObject {
    @Published var count: Int = UserDefaults.standard.integer(forKey: "count")
    
    func increment(by value: Int) {
        count += value
        saveCount()
    }
    
    func decrement(by value: Int) {
        count -= value
        saveCount()
    }
    
    func reset() {
        count = 0
        saveCount()
    }
    
    func saveCount() {
        UserDefaults.standard.set(count, forKey: "count")
    }
}
