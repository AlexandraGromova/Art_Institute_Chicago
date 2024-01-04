import Foundation

struct ArtworkResponse: Codable, Hashable {
    var data: [Artwork]
    var pagination: Pagination
}
struct Artwork: Codable, Identifiable, Hashable {
    var id : Int?
    var image_id : String?
    var api_link : String?
    var title : String?
    var place_of_origin : String?
    var date_start : Int?
    var artist_display : String?
    var style_title : String?
    var medium_display : String?
}
struct Pagination: Codable, Hashable {
    var next_url: String?
    var prev_url: String?
    var current_page: Int?
    var total_pages: Int?
}
struct ArtworkSearchResponse: Codable, Hashable {
    var data: Artwork
}


