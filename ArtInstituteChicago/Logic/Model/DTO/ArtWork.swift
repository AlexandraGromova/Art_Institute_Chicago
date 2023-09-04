import Foundation

struct ArtWorkResponse: Codable {
    var data: [ArtWork]
}
struct ArtWork: Codable, Identifiable {
    var id : Int?
    var image_id : String?
    var title : String?
    var place_of_origin : String?
    var date_start : Int?
    var artist_display : String?
    var style_title : String?
}
