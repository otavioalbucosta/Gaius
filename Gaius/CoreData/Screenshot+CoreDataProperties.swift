//
//  Screenshot+CoreDataProperties.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 23/10/22.
//
//

import Foundation
import CoreData


extension Screenshot {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Screenshot> {
        return NSFetchRequest<Screenshot>(entityName: "Screenshot")
    }

    @NSManaged public var game: Int64
    @NSManaged public var height: Int64
    @NSManaged public var id: Int64
    @NSManaged public var imageID: String?
    @NSManaged public var url: String?
    @NSManaged public var width: Int64

}

extension Screenshot : Identifiable {

}
