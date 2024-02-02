//
//  CharacterItemRow.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import SwiftUI

struct CharacterItemRow: View {
    
    @StateObject var viewModel: ImageViewModel
    var character : MarvelCharacterItem
    init(character:MarvelCharacterItem) {
        self.character = character
        _viewModel = StateObject(wrappedValue: ImageViewModel(path: character.thumbnail.path, fileExtension: character.thumbnail.extensionType))
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150,height: 150)
                    .clipShape(
                        RoundedRectangle(cornerSize: CGSize(width: 10.0, height: 10.0))
                    )
            }
            
            Text(character.name)
                .font(.headline)
                .foregroundColor(.white)
        }
        
        
    }
}

#Preview {
    
    let character = MarvelCharacterItem(id: 1, name: "example", description: "example", thumbnail: MarvelThumbnail(path:"http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73" , extensionType: "jpg"))
    
    return CharacterItemRow(character: character)
}
