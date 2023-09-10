import Foundation
import Combine

class ArtworkLocalSource {
    static let ART_WOTK_SOURCE = "art_work_source"
    
    func observeArtworks() -> AnyPublisher<[Artwork], Never> {
        return UserDefaults.standard.publisher(for: "art_work_source")
    }
    
    func saveArtworks(list: [Artwork]) {
        let convertor = JSONEncoder()
        let stringList = try? convertor.encode(list)
        print( "test_conv set \(stringList)")
        UserDefaults.standard.set(stringList, forKey: "art_work_source")
    }
}

extension UserDefaults {
    func publisher(for key: String) -> AnyPublisher<[Artwork], Never> {
        NotificationCenter.default.publisher(for: UserDefaults.didChangeNotification)
            .map { _ in
                let convertor = JSONDecoder()
                let strList = self.string(forKey: key)
                print( "test_conv get \(strList)")
                if strList == nil {
                    return []
                }
                return try! convertor.decode([Artwork].self, from: Data(strList!.utf8))
            }
            .eraseToAnyPublisher()
    }
}
