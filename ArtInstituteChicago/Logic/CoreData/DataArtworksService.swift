import Foundation
import CoreData
import Combine

class DataArtworksService {
    
    let persistentContainer: NSPersistentContainer = PersistentContainer.shared.container
    let request: NSFetchRequest<ArtworkCD> = ArtworkCD.fetchRequest()
    lazy var context = persistentContainer.viewContext
    
    func getFavorites() -> [ArtworkCD] {
        let list = try? context.fetch(request)
        return list ?? []
    }
    
    func save(artwork: Artwork) {
        
        context.performAndWait {
            do {
                if let id = artwork.id {
                    delete(artworkId: id)
                }
                let artworkCD = ArtworkCD(context: context)
                artworkCD.id = UUID()
                artworkCD.artist_display = artwork.artist_display
                artworkCD.date_start = Int64(artwork.date_start ?? 0)
                artworkCD.image_id = artwork.image_id
                artworkCD.medium_display = artwork.medium_display
                artworkCD.place_of_origin = artwork.place_of_origin
                artworkCD.style_title = artwork.style_title
                artworkCD.id_favorite = Int64(artwork.id ?? 0)
                artworkCD.title = artwork.title
                try? context.save()
            }
            catch {
                print("Failed to save artwork to core data: \(error)")
            }
        }
    }
    func delete(artworkId: Int) {
        do {
            let result = try context.fetch(request)
            result.forEach { item in
                if  item.id_favorite == artworkId {
                    context.delete(item)
                    try? context.save()
                }
            }
        } catch let error as NSError {
            print("Could not load data: \(error.localizedDescription)")
        }
    }
    
}
