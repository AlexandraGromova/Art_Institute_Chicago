import Foundation

struct Artwork: Codable, Identifiable {
    var id = UUID()
    var data: String
    var info: String
    var config: String
}
struct Data: Codable, Identifiable {
    var id = UUID()
    var title: String
}

struct Info: Codable, Identifiable {
    var id = UUID()
    var license_text: String
}

struct Config: Codable, Identifiable {
    var id = UUID()
    var iiif_url: String
    
}
