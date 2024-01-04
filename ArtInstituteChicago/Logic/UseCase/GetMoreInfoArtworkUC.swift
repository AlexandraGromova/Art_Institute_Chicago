import Foundation

class GetMoreInfoArtworkUC {
    
    private let repository : ArtworkRepository
    
    init(repository: ArtworkRepository) {
        self.repository = repository
    }
    
    func execute(artworkIndex: Int, completion: @escaping (ArtworkSearchResponse) -> ()) {
        repository.getArtwork(artworkIndex: artworkIndex, completion: completion)
    }
}
