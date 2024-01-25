import Foundation
import SwiftUI
import Combine
import CoreData

class ArtworkRepository {
    let remoteSource: RemoteSource
    let localSource: ArtworkLocalSource
    let dataArtworksService: DataArtworksService
    
    init(source: RemoteSource, localSource: ArtworkLocalSource, dataArtworksService: DataArtworksService) {
        remoteSource = source
        self.localSource = localSource
        self.dataArtworksService = dataArtworksService
    }
    
    func getArtworks(currentPage: Int, completion: @escaping (ArtworkResponse) -> ()) {
        remoteSource.getArtworks(currentPage: currentPage, completion: completion)
    }

    func getArtwork(artworkId: Int, completion: @escaping (ArtworkSearchResponse) -> ()) {
        remoteSource.getArtwork(artworkId: artworkId, completion: completion)
    }
    
    func getSearchingArtworks(text: String, currentPage: Int, completion: @escaping (ArtworkResponse) -> ()){
        remoteSource.getSearchingArtworks(text: text, currentPage: currentPage, completion: completion)
    }
    
    func saveArtwork(artwork: Artwork){
        dataArtworksService.save(artwork: artwork)
    }
    
    func getFavorites() -> [ArtworkCD] {
        return dataArtworksService.getFavorites()
    }
    
    func deleteFavorite(artworkId: Int){
        dataArtworksService.delete(artworkId: artworkId)
    }
    
    
    
}
