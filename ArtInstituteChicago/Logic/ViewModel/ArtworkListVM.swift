import Foundation
import Combine

class ArtworkListVM: ObservableObject {
    
    @Published var artworks: [Artwork] = []
    @Published var artworksCD: [Artwork] = []
    @Published var isSearchMode = false
    
    private let getArtworksUC : GetArtworksUC
    private let searchArtworksUC : SearchArtworksUC
    private let getMoreInfoArtworkUC : GetMoreInfoArtworkUC
    private let repository : ArtworkRepository
    
    private var cancelable = Set<AnyCancellable>()
    private var searchText = ""
    
    init(getArtworksUC : GetArtworksUC, searchArtworksUC: SearchArtworksUC, getMoreInfoArtworkUC : GetMoreInfoArtworkUC, repository : ArtworkRepository) {
        self.getArtworksUC = getArtworksUC
        self.searchArtworksUC = searchArtworksUC
        self.getMoreInfoArtworkUC = getMoreInfoArtworkUC
        self.repository = repository
        
        
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
        getArtworksUC.execute { list in
            self.artworks += list
        }
    }
    
    func updateIsHidden() -> Bool {
        return searchArtworksUC.updateIsHidden()
    }
    
    
    func updateSearchingArtworks(){
        return searchArtworksUC.execute(text: searchText) { list in
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
    
    func getMoreInfoArtwork(artworkId: Int) {
        getMoreInfoArtworkUC.execute(artworkId: artworkId){ response in
            let index = self.artworks.firstIndex { item in
                return item.id == response.data.id
            }
            if let index {
                self.artworks[index] = response.data
            }
        }
    }
    
    func saveSearchArtwork(artworkId: Int) {
        getMoreInfoArtworkUC.execute(artworkId: artworkId) { response in
            let index = self.artworks.firstIndex { item in
                return item.id == response.data.id
            }
            if let index {
                self.artworks[index] = response.data
                self.saveArtwork(artwork: self.artworks[index])
            }
        }
    }
    
    func saveArtwork(artwork: Artwork) {
        repository.saveArtwork(artwork: artwork)
    }
    
    func getFavoritsSubscription() {
        let list = repository.getFavorites()
        artworksCD = list.map({ item in
            return Artwork(id: Int(item.id_favorite), image_id: item.image_id, api_link: "", title: item.title, place_of_origin: item.place_of_origin, date_start: Int(item.date_start), artist_display: item.artist_display, style_title: item.style_title, medium_display: item.medium_display)
        })
    }
    
    func deleteFavorite(artworkId: Int) {
        repository.deleteFavorite(artworkId: artworkId)
    }
}

