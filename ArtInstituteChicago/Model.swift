import Foundation

struct Artworks: Codable {
    var data: [Data]
}
struct Data: Codable, Identifiable {
    var id : Int?
    var title : String?
    var place_of_origin : String?
    var date_start : Int?
    var artist_display : String?
    var style_title : String?
}
