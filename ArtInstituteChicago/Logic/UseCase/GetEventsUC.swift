import Foundation

class GetEventsUC {
    
    private let repository : EventRepository
    
    init(repository: EventRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Event]) -> ()) {
        repository.getEvents {response in
            completion(response.data)
        }
    }
    
}
