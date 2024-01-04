import Foundation
import SwiftUI
import Combine
import CoreData

class ArtworkRepository {
    let remoteSource: RemoteSource
    let localSource: ArtworkLocalSource
    
    init(source: RemoteSource, localSource: ArtworkLocalSource) {
        remoteSource = source
        self.localSource = localSource
    }
    
    func getArtworks(currentPage: Int, completion: @escaping (ArtworkResponse) -> ()) {
        remoteSource.getArtworks(currentPage: currentPage, completion: completion)
    }
    func getArtwork(artworkIndex: Int, completion: @escaping (ArtworkSearchResponse) -> ()) {
        remoteSource.getArtwork(artworkIndex: artworkIndex, completion: completion)
    }
    
    func getSearchingArtworks(text: String, currentPage: Int, completion: @escaping (ArtworkResponse) -> ()){
        remoteSource.getSearchingArtworks(text: text, currentPage: currentPage, completion: completion)
    }
    
    
    
    
    
}
