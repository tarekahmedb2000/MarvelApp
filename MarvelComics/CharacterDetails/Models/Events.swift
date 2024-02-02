//
//  Events.swift
//  MarvelComics
//
//  Created by tarek ahmed on 30/01/2024.
//

import Foundation


struct Event : Codable , Identifiable {
    let id: Int
    let title: String
    let description: String
    let start: String
    let end: String
    let thumbnail: MarvelThumbnail
}
