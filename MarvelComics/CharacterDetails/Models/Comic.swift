//
//  Comic.swift
//  MarvelComics
//
//  Created by tarek ahmed on 26/01/2024.
//

import Foundation


struct Comic: Codable , Identifiable {
    let id: Int
    let title: String
    let textObjects: [TextObject]
    let thumbnail: MarvelThumbnail
}

struct TextObject: Codable {
    let type: String
    let language: String
    let text: String
}


