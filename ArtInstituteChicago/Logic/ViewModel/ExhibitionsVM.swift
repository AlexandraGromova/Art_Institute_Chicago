import Foundation
import Combine

class ExhibitionsVM: ObservableObject {
    @Published var exhibition: [Exhibition] = []
    
    let repository : ExhibitionRepository
    let getExhibitionsUC : GetExhibitionsUC
    
    init(repository: ExhibitionRepository, getExhibitionsUC : GetExhibitionsUC) {
        self.repository = repository
        self.getExhibitionsUC = getExhibitionsUC
        
        self.exhibition = []
        getExhibitionsUC.reset()
        getExhibitions()
    }
    
    func getExhibitions() {
        getExhibitionsUC.execute { data in
            data.forEach { item in
                self.checkDuplicates(item: item)
            }
            self.exhibition += data
        }
    }
    
    func checkDuplicates(item : Exhibition) {
        for (index, item2) in exhibition.enumerated() {
            if item2.id == item.id {
                self.exhibition.remove(at: index)
            }
        }
    }
}
