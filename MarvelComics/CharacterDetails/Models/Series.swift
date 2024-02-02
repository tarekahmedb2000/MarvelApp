//
//  Series.swift
//  MarvelComics
//
//  Created by tarek ahmed on 31/01/2024.
//

import Foundation

struct Series: Codable , Identifiable {
    let id: Int64
    let title: String
    let thumbnail: MarvelThumbnail
    let startYear: Int
    let endYear: Int
}
