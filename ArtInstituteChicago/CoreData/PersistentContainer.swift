//
//  DataController.swift
//  ArtInstituteChicago
//
//  Created by Sasha on 03.11.2023.
//

import Foundation
import CoreData

class PersistentContainer : ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
}
