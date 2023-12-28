import Foundation
import Combine

class ArtworkListVM: ObservableObject {
    
    @Published var artworks: [Artwork] = []
    @Published var isSearchMode = false
    
    private let getArtworksUC : GetArtworksUC
    private let searchArtworksUC : SearchArtworksUC
    
    private var cancelable = Set<AnyCancellable>()
    private var searchText = ""
    
    init(getArtworksUC : GetArtworksUC, searchArtworksUC: SearchArtworksUC) {
        self.getArtworksUC = getArtworksUC
        self.searchArtworksUC = searchArtworksUC
        
        $isSearchMode
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .sink { newValue in
                if newValue == false {
                    self.artworks = []
                    getArtworksUC.reset()
                    self.updateArtworks()
                }
            }
            .store(in: &cancelable)

    }

    func updateArtworks() {
        print("updateArtworks()")
        getArtworksUC.execute { list in
            self.artworks += list
        }
    }
    
    func updateSearchingArtworks() {
        searchArtworksUC.execute(text: searchText) { list in
            self.artworks += list
        }
    }
    
    func searchArtworks(_ text: String?) {
        searchArtworksUC.reset()
        guard let text else {
            isSearchMode = false
            return
        }
        searchText = text
        if !text.isEmpty {
            isSearchMode = true
            self.artworks = []
            searchArtworksUC.reset()
            updateSearchingArtworks()
        }
    }
}
