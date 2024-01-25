import Foundation

class ExhibitionRepository {
    
    let remoteSource : RemoteSource
    
    init(remoteSource: RemoteSource) {
        self.remoteSource = remoteSource
    }
    
    func getExhibitions(currentPage: Int, completion: @escaping (ExhibitionResponse) -> ()) {
        remoteSource.getExhibitions(currentPage: currentPage, completion: completion)
    }
    
}
