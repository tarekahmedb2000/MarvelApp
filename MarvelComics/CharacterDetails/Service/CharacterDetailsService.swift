//
//  CharacterDetailsService.swift
//  MarvelComics
//
//  Created by tarek ahmed on 26/01/2024.
//

import Foundation
import Combine

class CharacterDetailsService : ObservableObject {
    
    @Published var charcterDetails : MarvelCharacterItem?
    @Published var characterComics = [Comic]()
    @Published var characterSeries = [Series]()
    @Published var characterEvents = [Event]()
    var cancelable = Set<AnyCancellable>()
    
    private var characterDetailsNetwrokManager = CharacterDetailsNetwrokManager()
    
    init(characterId: Int) {
        getCharacterDetails(characterId: characterId)
        getCharacterComics(characterId: characterId)
        getCharacterEvents(characterId: characterId)
        getCharacterSeries(characterId: characterId)
    }
    
    func getCharacterDetails(characterId : Int) {
        
        guard let url = APIURLConfig.getCharacterDetails(characterId: characterId).url else {
            return
        }
        
        characterDetailsNetwrokManager.loadCharactersDetails(url: url)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: {  [weak self] response in
                
                if let marvelCharacterItems = response.data.results.extractData() as? [MarvelCharacterItem],
                   let charcterDetails =  marvelCharacterItems.first {
                    self?.charcterDetails = charcterDetails
                }
            }
            .store(in: &cancelable)
    }
    
    func getCharacterComics(characterId: Int) {
        
        guard let url = APIURLConfig.getCharacterComics(characterId: characterId).url else {
            return
        }
        
        characterDetailsNetwrokManager.loadCharactersComics(url: url)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: {  [weak self] response in
                if let comics = response.data.results.extractData() as? [Comic] {
                    self?.characterComics = comics
                }
            }
            .store(in: &cancelable)
    }
    
    func getCharacterSeries(characterId: Int) {
        
        guard let url = APIURLConfig.getCharacterSeries(characterId: characterId).url else {
            return
        }
        
        characterDetailsNetwrokManager.loadCharactersSeries(url: url)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("series")
                    print(error.localizedDescription)
                }
            } receiveValue: {  [weak self] response in
                if let series = response.data.results.extractData() as? [Series] {
                    self?.characterSeries = series
                }
            }
            .store(in: &cancelable)
    }
    
    func getCharacterEvents(characterId: Int) {
        
        guard let url = APIURLConfig.getCharacterEvents(characterId: characterId).url else {
            return
        }
        
        characterDetailsNetwrokManager.loadCharactersEvents(url: url)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("events")
                    print(error.localizedDescription )
                }
            } receiveValue: {  [weak self] response in
                if let events = response.data.results.extractData() as? [Event] {
                    self?.characterEvents = events
                }
            }
            .store(in: &cancelable)
    }
    
    
    
    
}



