import Foundation

class GetArtworksUC {
    
    private var currentPage = 0
    private var totalPages = 1
    private let repository : ArtworkRepository
    
    init(repository: ArtworkRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Artwork]) -> ()) {
        print("test_request before \(currentPage)")
        repository.getArtworks(currentPage: currentPage + 1) { response in
            self.currentPage = response.pagination.current_page ?? 1
            self.totalPages = response.pagination.total_pages ?? 5
            print("test_request currentPage \(response.pagination.current_page) totalPage \(response.pagination.current_page)")
            completion(response.data)
        }
    }
    
    func reset(){
        currentPage = 0
        print("reset GetArtworksUC")
    }
}
