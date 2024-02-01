import Foundation

class SearchArtworksUC {
    
    private var currentPage = 0
    private var totalPages = 0
    private let repository : ArtworkRepository
    
    init(repository: ArtworkRepository) {
        self.repository = repository
    }
    
    func execute(text: String, completion: @escaping ([Artwork]) -> ()) {
        repository.getSearchingArtworks(text: text, currentPage: currentPage + 1) { response in
            self.totalPages = response.pagination.total_pages ?? 5
            self.currentPage = response.pagination.current_page ?? 1
            completion(response.data)
        }
    }
    
    func updateIsHidden() -> Bool {
        if currentPage == totalPages {
            return true
        }
        return false
    }
    
    func reset() {
        currentPage = 0
    }
}
