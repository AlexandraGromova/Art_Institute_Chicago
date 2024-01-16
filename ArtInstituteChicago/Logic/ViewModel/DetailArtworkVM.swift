import Foundation

class DetailArtworkVM: ObservableObject {
    
    private let repository : ArtworkRepository
    private let getMoreInfoArtworkUC : GetMoreInfoArtworkUC
    
    init( repository : ArtworkRepository, getMoreInfoArtworkUC : GetMoreInfoArtworkUC) {
        self.repository = repository
        self.getMoreInfoArtworkUC = getMoreInfoArtworkUC
    }
    
    func deleteFavorite(id: Int) {
        repository.deleteFavorite(artworkId: id)
    }
    
    func saveArtwork(artwork: Artwork) {
        repository.saveArtwork(artwork: artwork)
    }
    
    func getMoreInfoArtwork(by id: Int, complition: @escaping (Artwork) -> ()) {
        getMoreInfoArtworkUC.execute(artworkId: id) { response in
            complition(response.data)
        }
    }
}
