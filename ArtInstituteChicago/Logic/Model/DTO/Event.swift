import Foundation

struct EventResponse: Codable, Hashable {
    var data: [Event]
    var pagination : Pagination
}

struct Event: Codable, Identifiable, Hashable {
    var id: UUID
    var title: String?
    var image_url: String?
    var start_at: String?
    var end_at: String?
    var location: String?
}
