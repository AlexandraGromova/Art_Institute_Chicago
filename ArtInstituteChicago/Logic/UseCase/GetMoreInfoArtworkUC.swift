import Foundation

class GetMoreInfoArtworkUC {
    
    private let repository : ArtworkRepository
    
    init(repository: ArtworkRepository) {
        self.repository = repository
    }
    
    func execute(artworkId: Int, completion: @escaping (ArtworkSearchResponse) -> ()) {
        repository.getArtwork(artworkId: artworkId, completion: completion)
    }
}
