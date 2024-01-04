import Foundation

class GetArtworksUC {
    
    private var currentPage = 0
    private var totalPages = 1
    private let repository : ArtworkRepository
    
    init(repository: ArtworkRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Artwork]) -> ()) {
        repository.getArtworks(currentPage: currentPage + 1) { response in
            self.currentPage = response.pagination.current_page ?? 1
            self.totalPages = response.pagination.total_pages ?? 5
            completion(response.data)
        }
    }
    
    func reset(){
        currentPage = 0
    }
}
