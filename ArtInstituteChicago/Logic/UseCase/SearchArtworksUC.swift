import Foundation

class SearchArtworksUC {
    
    private var currentPage = 0
    private var totalPages = 0
    private let repository : ArtworkRepository
    
    init(repository: ArtworkRepository) {
        self.repository = repository
    }
    
    func execute(text: String, completion: @escaping ([Artwork]) -> ()){
        repository.getSearchingArtworks(text: text, currentPage: currentPage + 1) { response in
            self.totalPages = response.pagination.total_pages ?? 5
            self.currentPage = response.pagination.current_page ?? 1
            print("test_response_totalPages \(self.totalPages)")
            completion(response.data)
        }
    }
    
    func updateIsHidden() -> Bool{
        if currentPage == totalPages{
            return true
        }
        return false
    }
    
//    func getSearchArtwork(artworkIndex: Int, completion: @escaping (ArtworkSearchResponse) -> ()) {
//        repository.getArtwork(artworkIndex: artworkIndex, completion: completion)
//    }
    
    func reset(){
        currentPage = 0
        print("test_reset_response \(self.totalPages)")
    }
}
