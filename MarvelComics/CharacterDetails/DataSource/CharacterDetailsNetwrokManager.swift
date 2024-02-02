//
//  CharacterDetailsNetwrokManager.swift
//  MarvelComics
//
//  Created by tarek ahmed on 26/01/2024.
//

import Foundation

import Foundation
import Combine

class CharacterDetailsNetwrokManager {
    
    private var sharedNetworkManager = SharedNetworkManager()
    
    func loadCharactersDetails(url:URL) -> AnyPublisher<MarvelResponse,Error> {
        sharedNetworkManager.genericGetRequest(type: MarvelResponse.self, url: url)
    }
    
    func loadCharactersComics(url:URL) -> AnyPublisher<MarvelResponse,Error> {
        sharedNetworkManager.genericGetRequest(type: MarvelResponse.self, url: url)
    }
    
    func loadCharactersSeries(url:URL) -> AnyPublisher<MarvelResponse,Error> {
        sharedNetworkManager.genericGetRequest(type: MarvelResponse.self, url: url)
    }
    
    func loadCharactersEvents(url:URL) -> AnyPublisher<MarvelResponse,Error> {
        sharedNetworkManager.genericGetRequest(type: MarvelResponse.self, url: url)
    }
        
}
