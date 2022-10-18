//
//  Game.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 11/10/22.
//

import Foundation

struct Game: Codable {
    var id: Int?
    var ageRatings: [Int]?
    var aggregatedRating: Double?
    var aggregatedRatingCount: Int?
    var alternativeNames, artworks, bundles: [Int]?
    var category, collection, createdAt: Int?
    var cover: Cover?
    var dlcs, externalGames: [Int]?
    var firstReleaseDate, follows: Int?
    var franchises, gameEngines, gameModes: [Int]?
    var genres: [Genre]
    var involvedCompanies, keywords: [Int]?
    var name: String?
    var playerPerspectives: [Int]?
    var platforms: [Platforms]
    var rating: Double?
    var ratingCount: Int?
    var releaseDates: [Int]?
//    var similarGames: [Game]?
    var screenshots: [Screenshot]?
    var slug, storyline, summary: String?
    var tags, themes: [Int]?
    var totalRating: Double?
    var totalRatingCount, updatedAt: Int?
    var url: String?
    var videos, websites: [Int]?
    var checksum: String?
}
