import Foundation

class EventRepository {
    
    let remoteSource : RemoteSource
    
    init(remoteSource: RemoteSource) {
        self.remoteSource = remoteSource
    }
    
    func getEvents(completion: @escaping (EventResponse) -> ()) {
        remoteSource.getEvents(completion: completion)
    }
    
}
