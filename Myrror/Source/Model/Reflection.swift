//
//  Reflection+CoreDataProperties.swift
//  Myrror
//
//  Created by Beatriz Leonel on 14/06/24.
//
//

import Foundation
import CoreData

@objc(Reflection)
final class Reflection: NSManagedObject {}

extension Reflection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reflection> {
        return NSFetchRequest<Reflection>(entityName: "Reflection")
    }

    @NSManaged public var date: Date?
    @NSManaged public var emoji: String?
    @NSManaged public var subject: String?
    @NSManaged public var text_reflection: String?

}

extension Reflection : Identifiable { }

extension Reflection: CoreDataModel { }
