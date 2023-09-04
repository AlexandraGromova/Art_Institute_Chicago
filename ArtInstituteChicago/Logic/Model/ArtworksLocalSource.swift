//
//  ArtworksLocalSource.swift
//  ArtInstituteChicago
//
//  Created by Sasha on 01.09.2023.
//

import Foundation
import Combine

class ArtworkLocalSource {
    static let ART_WOTK_SOURCE = "art_work_source"
    
    func observeArtworks() -> AnyPublisher<[ArtWork], Never> {
//        UserDefaults.standard.
//        UserDefaults.standard.publisher(for: ArtworkLocalSource.ART_WOTK_SOURCE)
        return UserDefaults.standard.publisher(for: "art_work_source")
    }
    
    func saveArtworks(list: [ArtWork]) {
        let convertor = JSONEncoder()
        let stringList = try? convertor.encode(list)
        print( "test_conv set \(stringList)")
        UserDefaults.standard.set(stringList, forKey: "art_work_source")
    }
}

extension UserDefaults {
    func publisher(for key: String) -> AnyPublisher<[ArtWork], Never> {
        NotificationCenter.default.publisher(for: UserDefaults.didChangeNotification)
            .map { _ in
                let convertor = JSONDecoder()
                let strList = self.string(forKey: key)
                print( "test_conv get \(strList)")
                if strList == nil {
                    return []
                }
                return try! convertor.decode([ArtWork].self, from: Data(strList!.utf8))
            }
            .eraseToAnyPublisher()
    }
}
