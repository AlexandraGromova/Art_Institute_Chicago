import Foundation
import CoreData

class PersistentContainer : ObservableObject {
    
    static let shared = PersistentContainer()
    
    let container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
}
