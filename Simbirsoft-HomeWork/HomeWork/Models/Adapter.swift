

import Foundation


struct Adapter {
    
 
    func getTasks(from events: [EventModel]) -> [TaskModel] {
        var tasksArr = [TaskModel]()
        for event in events {
            let task = TaskModel(id: event.id, date_start: event.dateInterval.start.timeIntervalSince1970, date_finish: event.dateInterval.end.timeIntervalSince1970, name: event.text, description: event.description)
            tasksArr.append(task)
        }
        return tasksArr
    }
    

    func getEvents(from tasks: [TaskModel]) -> [EventModel] {
        var eventsArr = [EventModel]()
        for task in tasks {
            let event = EventModel()
            event.dateInterval = DateInterval(start: Date(timeIntervalSince1970: task.date_start), end: Date(timeIntervalSince1970: task.date_finish))
            event.text = task.name
            event.description = task.description
            event.id = task.id
            eventsArr.append(event)
        }
        return eventsArr
    }
}
