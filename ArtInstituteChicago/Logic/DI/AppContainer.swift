import Foundation
import Swinject
import CoreData

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
            ArtworkRepository(source: r.resolve(RemoteSource.self)!, localSource: r.resolve(ArtworkLocalSource.self)!, dataArtworksService: r.resolve(DataArtworksService.self)!)
        }
        container.register(ArtworkListVM.self) { r in
            ArtworkListVM(getArtworksUC: r.resolve(GetArtworksUC.self)!, searchArtworksUC: r.resolve(SearchArtworksUC.self)!, getMoreInfoArtworkUC: r.resolve(GetMoreInfoArtworkUC.self)!,  repository: r.resolve(ArtworkRepository.self)!)
        }
        container.register(InfoVM.self) { r in
            InfoVM()
        }
        container.register(GetArtworksUC.self) { r in
            GetArtworksUC(repository: r.resolve(ArtworkRepository.self)!)
        }
        container.register(SearchArtworksUC.self) { r in
            SearchArtworksUC(repository: r.resolve(ArtworkRepository.self)!)
        }
        
        container.register(GetMoreInfoArtworkUC.self) { r in
            GetMoreInfoArtworkUC(repository: r.resolve(ArtworkRepository.self)!)
        }
        container.register(DataArtworksService.self) { r in
            DataArtworksService()
        }
        container.register(FavoritesVM.self) { r in
            FavoritesVM(repository: r.resolve(ArtworkRepository.self)!)
        }
        container.register(DetailArtworkVM.self) { r in
            DetailArtworkVM(repository: r.resolve(ArtworkRepository.self)!, getMoreInfoArtworkUC: r.resolve(GetMoreInfoArtworkUC.self)!)
        }
        container.register(ExhibitionRepository.self) { r in
            ExhibitionRepository(remoteSource: r.resolve(RemoteSource.self)!)
        }
        container.register(ExhibitionsVM.self) { r in
            ExhibitionsVM(repository: r.resolve(ExhibitionRepository.self)!, getExhibitionsUC: r.resolve(GetExhibitionsUC.self)!)
        }
        container.register(GetExhibitionsUC.self) { r in
            GetExhibitionsUC(repository: r.resolve(ExhibitionRepository.self)!)
        }
        container.register(EventRepository.self) { r in
            EventRepository(remoteSource:  r.resolve(RemoteSource.self)!)
        }
        container.register(GetEventsUC.self) { r in
            GetEventsUC(repository: r.resolve(EventRepository.self)!)
        }
        container.register(EventsVM.self) { r in
            EventsVM(getEventsUC: r.resolve(GetEventsUC.self)!)
        }
        container.register(UserLocalSource.self) { r in
            UserLocalSource()
        }
        container.register(UserRepository.self) { r in
            UserRepository(localSource: r.resolve(UserLocalSource.self)!)
        }
        container.register(UserVM.self) { r in
            UserVM(repository: r.resolve(UserRepository.self)!)
        }
        
    }
    
    static func resolve<T>(_ serviceType: T.Type) -> T {
        return container.resolve(serviceType)!
    }
}
