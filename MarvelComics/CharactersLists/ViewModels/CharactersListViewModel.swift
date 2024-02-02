//
//  CharactersListViewModel.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import Foundation


class CharactersListViewModel : ObservableObject {
    @Published var characterList = [MarvelCharacterItem]()
    private var dataService = CharacterListService()
    
    func loadCharactersList() {
        dataService.$charcterList
            .assign(to: &$characterList)
    }
    
    
    
    
}
