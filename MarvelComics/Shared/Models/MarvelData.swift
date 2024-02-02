//
//  MarvelData.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import Foundation

struct MarvelData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: marvelResults
}

enum marvelResults : Codable {
    case charcterItems([MarvelCharacterItem])
    case charcterComics([Comic])
    case charcterSeries([Series])
    case charcterEvents([Event])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let marvelCharacterItems = try? container.decode([MarvelCharacterItem].self) {
            self = .charcterItems(marvelCharacterItems)
            return
        }
        if let comics = try? container.decode([Comic].self) {
            self = .charcterComics(comics)
            return
        }
        
        if let events = try? container.decode([Event].self) {
            self = .charcterEvents(events)
            return
        }
        
        if let series = try? container.decode([Series].self) {
            self = .charcterSeries(series)
            return
        }
        
        throw DecodingError.typeMismatch(marvelResults.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MyValue"))
    }
    
    func extractData() -> Any {
            switch self {
            case .charcterItems(let characterItems):
                return characterItems
            case .charcterComics(let comics):
                return comics
            case .charcterEvents(let events):
                return events
            case .charcterSeries(let series):
                return series
            }
    }
    
}
