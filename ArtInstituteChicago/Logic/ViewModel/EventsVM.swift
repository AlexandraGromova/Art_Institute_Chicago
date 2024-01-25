import Foundation
import Combine

class EventsVM: ObservableObject {
    @Published var events: [Event] = []
    @Published var dailyEvents: [[Event]] = [[]]
    @Published var days: [String] = []
    
    let getEventsUC : GetEventsUC
    
    init(getEventsUC : GetEventsUC ) {
        self.getEventsUC = getEventsUC
        self.events = []
        getEvents()
        
    }
    
    func getEvents() {
        getEventsUC.execute { data in
            self.events += data
            self.getParseEvents()
        }
    }
    
    func getParseEvents() {
        guard var startDate = events.first?.start_at else { return }
        var columnIndex = 0
        var eventsColumn: [[Event]] = [[]]
        let testList = events.forEach { event in
            if startDate == event.start_at {
                eventsColumn[columnIndex].append(event)
            } else {
                startDate = event.start_at ?? ""
                eventsColumn.append([event])
                columnIndex += 1
            }
        }
        dailyEvents = eventsColumn
    }
}
