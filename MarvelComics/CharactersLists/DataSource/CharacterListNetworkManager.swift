//
//  CharacterListNetworkManager.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import Foundation
import Combine

class CharacterListNetworkManager {
    
    private var sharedNetworkManager = SharedNetworkManager()
    
    func loadCharactersList(url:URL) -> AnyPublisher<MarvelResponse,Error> {
        sharedNetworkManager.genericGetRequest(type: MarvelResponse.self, url: url)
    }
    
}

