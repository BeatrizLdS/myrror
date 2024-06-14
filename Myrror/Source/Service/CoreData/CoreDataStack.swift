//
//  CoreDataStack.swift
//  Myrror
//
//  Created by Beatriz Leonel on 13/06/24.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    private let container: NSPersistentContainer
    
    private(set) lazy var managedContex: NSManagedObjectContext = {
        return self.container.viewContext
    }()

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MyrrorData")
        
        if inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            self.container.persistentStoreDescriptions = [description]
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let receivedError = error {
                // MARK: Catch error!
                print("Some error happen to acess persisten store in Core Data")
            }
        }
    }
    
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                // MARK: Catch error!
                print("Error to save datas in CoreData")
            }
        }
    }
}
