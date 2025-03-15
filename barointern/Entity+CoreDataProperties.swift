//
//  Entity+CoreDataProperties.swift
//  
//
//  Created by 공명선 on 3/15/25.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var id: String?
    @NSManaged public var password: String?
    @NSManaged public var name: String?

}
