import Foundation
import Combine

class ArtworkListVM: ObservableObject {
    
    @Published var artworks: [Artwork] = []
    @Published var isSearchMode = false
    
    private let getArtworksUC : GetArtworksUC
    private let searchArtworksUC : SearchArtworksUC
    private let getMoreInfoArtworkUC : GetMoreInfoArtworkUC
    private let getFavoriteArtworkUC : GetFavoriteArtworkUC
    
    private var cancelable = Set<AnyCancellable>()
    private var searchText = ""
    
    init(getArtworksUC : GetArtworksUC, searchArtworksUC: SearchArtworksUC, getMoreInfoArtworkUC : GetMoreInfoArtworkUC, getFavoriteArtworkUC : GetFavoriteArtworkUC) {
        self.getArtworksUC = getArtworksUC
        self.searchArtworksUC = searchArtworksUC
        self.getMoreInfoArtworkUC = getMoreInfoArtworkUC
        self.getFavoriteArtworkUC = getFavoriteArtworkUC
        
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
    
    func deliteFevorite(idArtwork : String, moc: Any, func: () -> ()){
        getFavoriteArtworkUC.deliteFav(idArtwork: idArtwork, moc: moc, func: `func`)
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
    
    func getMoreInfoArtwork(artworkIndex: Int) {
        getMoreInfoArtworkUC.execute(artworkIndex: artworkIndex){ response in
            let index = self.artworks.firstIndex { item in
                return item.id == response.data.id
            }
            if let index {
                self.artworks[index] = response.data
            }
        }
    }
}
    
