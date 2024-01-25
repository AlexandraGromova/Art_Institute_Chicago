import Foundation

struct ExhibitionResponse: Codable, Hashable {
    var data: [Exhibition]
    var pagination: Pagination
}

struct Exhibition: Codable, Identifiable, Hashable {
    var id : Int
    var api_link: String?
    var title: String
    var image_url: String?
    var status: String
    var short_description: String?
    var gallery_title: String?
    var aic_start_at: String?
    var aic_end_at: String?
}
