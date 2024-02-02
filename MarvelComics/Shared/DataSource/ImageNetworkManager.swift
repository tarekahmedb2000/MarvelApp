//
//  ImageNetworkManager.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import Foundation
import SwiftUI
import Combine

class ImageNetworkManager {
    
    private var sharedNetworkManager = SharedNetworkManager()
    
    func loadImage(url:URL) -> AnyPublisher<Data,URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
    
}
