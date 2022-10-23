//
//  Game+CoreDataProperties.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 23/10/22.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var aggregatedRatin: Double
    @NSManaged public var category: Int64
    @NSManaged public var firstReleaseDate: Int64
    @NSManaged public var follows: Int64
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var rating: Double
    @NSManaged public var slug: String?
    @NSManaged public var storyline: String?
    @NSManaged public var summary: String?
    @NSManaged public var tags: NSObject?
    @NSManaged public var themes: NSObject?
    @NSManaged public var totalRating: Double
    @NSManaged public var videos: NSObject?
    @NSManaged public var websites: NSObject?
    @NSManaged public var cover: NSSet?
    @NSManaged public var genre: NSSet?
    @NSManaged public var platform: NSSet?
    @NSManaged public var screenshot: NSSet?

}

// MARK: Generated accessors for cover
extension Game {

    @objc(addCoverObject:)
    @NSManaged public func addToCover(_ value: Cover)

    @objc(removeCoverObject:)
    @NSManaged public func removeFromCover(_ value: Cover)

    @objc(addCover:)
    @NSManaged public func addToCover(_ values: NSSet)

    @objc(removeCover:)
    @NSManaged public func removeFromCover(_ values: NSSet)

}

// MARK: Generated accessors for genre
extension Game {

    @objc(addGenreObject:)
    @NSManaged public func addToGenre(_ value: Genre)

    @objc(removeGenreObject:)
    @NSManaged public func removeFromGenre(_ value: Genre)

    @objc(addGenre:)
    @NSManaged public func addToGenre(_ values: NSSet)

    @objc(removeGenre:)
    @NSManaged public func removeFromGenre(_ values: NSSet)

}

// MARK: Generated accessors for platform
extension Game {

    @objc(addPlatformObject:)
    @NSManaged public func addToPlatform(_ value: Platforms)

    @objc(removePlatformObject:)
    @NSManaged public func removeFromPlatform(_ value: Platforms)

    @objc(addPlatform:)
    @NSManaged public func addToPlatform(_ values: NSSet)

    @objc(removePlatform:)
    @NSManaged public func removeFromPlatform(_ values: NSSet)

}

// MARK: Generated accessors for screenshot
extension Game {

    @objc(addScreenshotObject:)
    @NSManaged public func addToScreenshot(_ value: Screenshot)

    @objc(removeScreenshotObject:)
    @NSManaged public func removeFromScreenshot(_ value: Screenshot)

    @objc(addScreenshot:)
    @NSManaged public func addToScreenshot(_ values: NSSet)

    @objc(removeScreenshot:)
    @NSManaged public func removeFromScreenshot(_ values: NSSet)

}

extension Game : Identifiable {

}
