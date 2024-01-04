import Foundation
import SwiftUI

class GetFavoriteArtworkUC {
    
    @FetchRequest(sortDescriptors: []) var artworksCD: FetchedResults<ArtworkCD>
    
    func deliteFav(idArtwork : String, moc : Any, func: () -> ()) {
        
        _ = artworksCD.contains { item in
            if  item.id_favorite == idArtwork {
                (moc as AnyObject).delete(item)
                return true
            }
            return false
        }
     
    }
    
}
