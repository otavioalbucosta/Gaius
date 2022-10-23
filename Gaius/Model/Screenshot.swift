//
//  Screenshot.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 18/10/22.
//

import Foundation

struct Screenshot: Codable {
    var id: Int?
//    var alphaChannel, animated: Bool?
    var game, height: Int?
    var imageID, url: String?
    var width: Int?
//    var checksum: String?
}
