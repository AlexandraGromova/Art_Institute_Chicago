import Foundation

class ArtWorkListVM: ObservableObject {
    @Published var artworks: [ArtWork] = []
    
    private let repository: ArtworkRepository // = ArtworkRepository(source: RemoteSource())
    
    init(repository: ArtworkRepository) {
        self.repository = repository
        updateArtworks()
    }
    
    func updateArtworks() {
        repository.getArtworks { [weak self] list in
            guard let self else { return }
            self.artworks = list
        }
//        repository.updateArtworks().sink { list in
//            self.artworks = list
//        }
    }
}
