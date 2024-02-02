//
//  CharacterDetailsImageView.swift
//  MarvelComics
//
//  Created by tarek ahmed on 26/01/2024.
//

import SwiftUI

struct CharacterDetailsImageView: View {
    
    @StateObject var viewModel: ImageViewModel
    
    
    init(character: MarvelCharacterItem) {
        _viewModel =  StateObject(wrappedValue: ImageViewModel(path: character.thumbnail.path, fileExtension: character.thumbnail.extensionType))
    }
    
    var body: some View {
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                
        }
    }
}

#Preview {
    
    let character = MarvelCharacterItem(id: 1, name: "example", description: "example", thumbnail: MarvelThumbnail(path:"http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73" , extensionType: "jpg"))
    
    return CharacterDetailsImageView(character: character)
    
}
