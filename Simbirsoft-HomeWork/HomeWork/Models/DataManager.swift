

import Foundation

class DataManager {

    static let shared = DataManager()
    private let adapter = Adapter() // [TaskModel] <=> [EventModel]
    
    private init() { }
    

    private var tasks: [TaskModel] {
        get {
            guard let data = try? Data(contentsOf: .tasks) else { return [] }
            return (try? JSONDecoder().decode([TaskModel].self, from: data)) ?? []
        }
        set {
            try? JSONEncoder().encode(newValue).write(to: .tasks)
        }
    }
    

    var events: [EventModel] {
        get {
            adapter.getEvents(from: tasks)
        }
        set {
            tasks = adapter.getTasks(from: newValue)
        }
    }
}
