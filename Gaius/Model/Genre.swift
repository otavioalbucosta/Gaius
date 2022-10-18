//
//  Genre.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 18/10/22.
//

import Foundation

struct Genre: Codable {
    var id, createdAt: Int?
    var name, slug: String?
    var updatedAt: Int?
    var url: String?
    var checksum: String?
}
