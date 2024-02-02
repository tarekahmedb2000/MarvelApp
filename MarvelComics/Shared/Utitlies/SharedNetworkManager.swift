//
//  SharedNetworkManager.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import Foundation
import Combine


class SharedNetworkManager {
    
    func genericGetRequest<T:Codable>(type:T.Type,url:URL) -> AnyPublisher<T,Error> {
        URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: type, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
    
    
    
    
    
}
