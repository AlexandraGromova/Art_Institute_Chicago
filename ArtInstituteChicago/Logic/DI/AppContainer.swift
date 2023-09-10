import Foundation
import Swinject

class AppContainer {
    static private let container = Container()
    
    static func setup() {
        container.register(RemoteSource.self) { r in
            RemoteSource()
        }
        container.register(ArtworkLocalSource.self) { r in
            ArtworkLocalSource()
        }
        container.register(ArtworkRepository.self) { r in
            ArtworkRepository(source: r.resolve(RemoteSource.self)!, localSource: r.resolve(ArtworkLocalSource.self)!)
        }
        container.register(ArtWorkListVM.self) { r in
            ArtWorkListVM(repository: r.resolve(ArtworkRepository.self)!)
        }
//        container.register(InfoScreenVM.self) { r in
//            InfoScreenVM(repository: r.resolve(ArtworkRepository.self)!)
//        }
        
    }
    
    static func resolve<T>(_ serviceType: T.Type) -> T {
        return container.resolve(serviceType)!
    }
}
