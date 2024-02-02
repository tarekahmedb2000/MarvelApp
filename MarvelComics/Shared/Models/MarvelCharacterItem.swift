//
//  MarvelCharacterItem.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import Foundation

struct MarvelCharacterItem: Codable , Identifiable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: MarvelThumbnail
}

struct MarvelThumbnail: Codable {
    let path: String
    let extensionType: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case extensionType = "extension"
    }
}
