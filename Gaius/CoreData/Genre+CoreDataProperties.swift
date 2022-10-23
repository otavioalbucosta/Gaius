//
//  Genre+CoreDataProperties.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 23/10/22.
//
//

import Foundation
import CoreData


extension Genre {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Genre> {
        return NSFetchRequest<Genre>(entityName: "Genre")
    }

    @NSManaged public var createdAt: Int64
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var slug: String?
    @NSManaged public var url: String?

}

extension Genre : Identifiable {

}
