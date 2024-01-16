import Foundation

class FavoritesVM: ObservableObject {
    @Published var artworksCD: [Artwork] = []
    
    private let repository : ArtworkRepository
    
    init(repository: ArtworkRepository) {
        self.repository = repository
    }
    
    func saveArtwork(artwork: Artwork){
        repository.saveArtwork(artwork: artwork)
    }
    
    func deleteFavorite(artworkId: Int){
        repository.deleteFavorite(artworkId: artworkId)
    }
    
    func getFavoritsSubscription(){
        let list = repository.getFavorites()
        artworksCD = list.map({ item in
            return Artwork(id: Int(item.id_favorite), image_id: item.image_id, api_link: "", title: item.title, place_of_origin: item.place_of_origin, date_start: Int(item.date_start), artist_display: item.artist_display, style_title: item.style_title, medium_display: item.medium_display)
        })
    }
    
    
    
}
