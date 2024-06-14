//
//  CoreDataModel.swift
//  Myrror
//
//  Created by Beatriz Leonel on 13/06/24.
//

import Foundation
import CoreData

protocol CoreDataModel: RecordModelType where Context == NSManagedObjectContext {}

extension CoreDataModel where Self: NSManagedObject {
    static var context: NSManagedObjectContext {
        return CoreDataStack.shared.managedContex
    }
    
    static func create() -> Self {
        return .init(context: context)
    }
    
    func destruct() {
        Self.context.delete(self)
    }
    
    static func getAll() -> [Self] {
        let entityName = String(describing: self)
        let request = NSFetchRequest<Self>(entityName: entityName)
        guard let result = try? context.fetch(request) else {
            return []
        }
        return result
    }
    
    static func find(query: String, arguments: [Any]?) -> [Self] {
        let query = NSPredicate(format: query, argumentArray: arguments)
        let entityName = String(describing: self)
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.predicate = query
        guard let result = try? context.fetch(request) else {
            return []
        }
        return result
    }
}
