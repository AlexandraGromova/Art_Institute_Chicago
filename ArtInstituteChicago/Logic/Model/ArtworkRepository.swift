import Foundation
import Combine

class ArtworkRepository {
    let remoteSource: RemoteSource
    let localSource: ArtworkLocalSource
    
    init(source: RemoteSource, localSource: ArtworkLocalSource) {
        remoteSource = source
        self.localSource = localSource
    }
    
    func getArtworks(currentPage: Int, completion: @escaping (ArtworkResponse) -> ()) {
        remoteSource.getArtworks(currentPage: currentPage, completion: completion)
    }
    
    func getSearchingArtworks(text: String, currentPage: Int, completion: @escaping (ArtworkResponse) -> ()){
        remoteSource.getSearchingArtworks(text: text, currentPage: currentPage, completion: completion)
    }
    
    
//    func updateArtworks() -> AnyPublisher<[ArtWork], Never> {
//        remoteSource.getArtworks { list in
//            self.localSource.saveArtworks(list: list)
//        }
//        return localSource.observeArtworks()
//    }
}
