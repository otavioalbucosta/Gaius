//
//  Platforms+CoreDataProperties.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 23/10/22.
//
//

import Foundation
import CoreData


extension Platforms {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Platforms> {
        return NSFetchRequest<Platforms>(entityName: "Platforms")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var slug: String?

}

extension Platforms : Identifiable {

}
