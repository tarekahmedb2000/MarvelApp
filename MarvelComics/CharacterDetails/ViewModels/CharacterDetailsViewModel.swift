//
//  CharacterDetailsViewModel.swift
//  MarvelComics
//
//  Created by tarek ahmed on 26/01/2024.
//

import Foundation
import SwiftUI

class CharacterDetailsViewModel : ObservableObject {
    
    
    enum CharacterDetailsViews  : Int {
       case description
       case comics
       case series
       case events
    }
    
    @Published var characterDetails :MarvelCharacterItem?
    @Published var image :UIImage?
    @Published var characterComics = [Comic]()
    @Published var characterSeries = [Series]()
    @Published var characterEvents = [Event]()
    var titles = ["Description" ,"Comics","Series","Events"]
    
    
    private var dataService: CharacterDetailsService
    
    init(characterId: Int) {
        dataService = CharacterDetailsService(characterId: characterId)
    }
    
    func loadCharactersList() {
        dataService.$charcterDetails
            .assign(to: &$characterDetails)
    }
    
    func loadCharactersComics() {
        dataService.$characterComics
            .assign(to: &$characterComics)
    }
    
    func loadCharactersEvents() {
        dataService.$characterEvents
            .assign(to: &$characterEvents)
    }
    
    func loadCharactersSeries() {
        dataService.$characterSeries
            .assign(to: &$characterSeries)
    }
    
}

