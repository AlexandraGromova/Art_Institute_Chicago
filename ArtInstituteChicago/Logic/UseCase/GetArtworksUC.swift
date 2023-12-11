import Foundation

class GetArtworksUC {
    
    let repository : ArtworkRepository
    
    init(repository: ArtworkRepository) {
        self.repository = repository
    }
    
    func execute() {
        repository.getArtworks(currentPage: <#T##Int#>, completion: <#T##([Artwork]) -> ()#>)
    }
}
