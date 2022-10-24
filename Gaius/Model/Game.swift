//
//  Game.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 11/10/22.
//

import Foundation

struct Game: Codable {
    var id: Int?
    var aggregatedRating: Double?
//    var artworks: [Int]?
    var category: Int?
    var cover: Cover?
//    var dlcs: [Int]?
    var firstReleaseDate, follows: Int?
//    var franchises, gameModes: [Int]?
    var genres: [Genre]?
    var name: String?
//    var playerPerspectives: [Int]?
    var platforms: [Platforms]?
    var rating: Double?
    var screenshots: [Screenshot]?
//    var slug, storyline, summary: String?
    var tags, themes: [Int]?
    var totalRating: Double?
    var videos, websites: [Int]?
}
