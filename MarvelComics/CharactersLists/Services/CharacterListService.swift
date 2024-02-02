//
//  CharacterListService.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import Foundation
import Combine

class CharacterListService : ObservableObject {
    
    @Published var charcterList = [MarvelCharacterItem]()
    var cancelable = Set<AnyCancellable>()
    
    private var characterListNetworkManager = CharacterListNetworkManager()
    
    init() {
        getCharacterList()
    }
    
    func getCharacterList() {
        
        guard let url = APIURLConfig.getCharacterList.url else {
            return
        }
        
        characterListNetworkManager.loadCharactersList(url: url)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: {  [weak self] response in
                if let marvelCharacterItems = response.data.results.extractData() as? [MarvelCharacterItem] {
                    self?.charcterList = marvelCharacterItems
                }
                
            }
            .store(in: &cancelable)
    }
    
}

