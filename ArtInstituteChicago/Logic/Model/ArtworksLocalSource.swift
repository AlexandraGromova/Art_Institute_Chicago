import Foundation
import Combine

class ArtworkLocalSource {
    static let ART_WOTK_SOURCE = "artwork_source"
    
    func observeArtworks() -> AnyPublisher<[Artwork], Never> {
        return UserDefaults.standard.publisher(for: "artwork_source")
    }
    
    func saveArtworks(list: [Artwork]) {
        let convertor = JSONEncoder()
        let stringList = try? convertor.encode(list)
        print( "test_conv set \(stringList)")
        UserDefaults.standard.set(stringList, forKey: "artwork_source")
    }
    
    func saveUserName(name: Any){
        UserDefaults.standard.set(name, forKey: "userName")
    }
    
    func getUserName(for key: String) -> String?{
        return (UserDefaults.standard.object(forKey: key) as! String)
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
