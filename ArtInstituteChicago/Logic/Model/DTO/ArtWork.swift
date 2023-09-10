import Foundation

struct ArtworkResponse: Codable {
    var data: [Artwork]
    var pagination: Pagination
}
struct Artwork: Codable, Identifiable {
    var id : Int?
    var image_id : String?
    var title : String?
    var place_of_origin : String?
    var date_start : Int?
    var artist_display : String?
    var style_title : String?
}
struct Pagination: Codable {
    var next_url: String?
    var prev_url: String?
    var current_page: Int?
    
}