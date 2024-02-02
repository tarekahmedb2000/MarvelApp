//
//  ContentView.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import SwiftUI

struct CharacterListView: View {
    
    @StateObject var viewModel = CharactersListViewModel()
    @State var isTapped = false
    
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Image("marvelBackGround")
                    .resizable()
                    .ignoresSafeArea()
                
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: gridItems,spacing: 10) {
                        ForEach(viewModel.characterList) { character in
                            
                            
                            NavigationLink(
                                destination: CharacterDetailsView(characterId: character.id),
                                label: {
                                    CharacterItemRow(character: character)
                                        .frame(width: 200,height: 200)
                                }
                            )
                            
                        }
                    }
                }
                
            }
            .onAppear {
                viewModel.loadCharactersList()
            }
            
        }
    }
}

#Preview {
    CharacterListView()
}
