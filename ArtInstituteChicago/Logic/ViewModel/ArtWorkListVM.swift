import Foundation

class ArtWorkListVM: ObservableObject {
    @Published var artworks: [Artwork] = []
    
    private let repository: ArtworkRepository // = ArtworkRepository(source: RemoteSource())
    
    init(repository: ArtworkRepository) {
        self.repository = repository
        updateArtworks()
    }
    
    func updateArtworks() {
        repository.getArtworks { [weak self] list in
            guard let self else { return }
            print("updateArtworks")
            self.artworks.append(contentsOf: list)
//            self.artworks = Array(Set(self.artworks))
            print("Art", self.artworks.count)
        }
//        repository.updateArtworks().sink { list in
//            self.artworks = list
//        }
    }
}
