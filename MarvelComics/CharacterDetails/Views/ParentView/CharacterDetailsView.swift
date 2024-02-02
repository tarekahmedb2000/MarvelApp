//
//  CharacterDetailsView.swift
//  MarvelComics
//
//  Created by tarek ahmed on 26/01/2024.
//

import SwiftUI

struct CharacterDetailsView: View {
    @StateObject var viewModel : CharacterDetailsViewModel
    
    @State var selectedSegment : Int = 0
    
    init(characterId: Int) {
        _viewModel = StateObject(wrappedValue: CharacterDetailsViewModel(characterId: characterId))
    }
    
    var body: some View {
        
        GeometryReader { reader in
            ScrollView {
                
                ZStack(alignment:.top) {
                    Image("marvelBackGround")
                        .resizable()
                    
                    Color.black.opacity(0.5)
                    
                    
                    VStack(alignment: .center,spacing: 20) {
                        
                        if let characterDetails = viewModel.characterDetails {
                            
                            CharacterDetailsImageView(character: characterDetails)
                                .frame(width: 300,height: 300)
                                .clipShape(
                                    Circle()
                                )
                                .padding()
                            
                            Text(characterDetails.name)
                                .font(.title)
                                .foregroundColor(.white)
                            
                            Picker("Select an option", selection: $selectedSegment) {
                                ForEach(0..<viewModel.titles.count) { index in
                                    Text(viewModel.titles[index]).tag(index)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .background(
                                Color.white.opacity(0.6)
                            )
                            
                            if let selectedSegment = CharacterDetailsViewModel.CharacterDetailsViews(rawValue: selectedSegment) {
                                switch selectedSegment {
                                case .description :
                                    getDescription(character: characterDetails)
                                case .comics :
                                    getComics()
                                case .series :
                                    getSeries()
                                case .events :
                                    getEvents()
                                }
                            }
                        }
                    }
                    .ignoresSafeArea(edges:.top)
                }
                .ignoresSafeArea()
            }
            
        }
        .onAppear {
            viewModel.loadCharactersList()
            viewModel.loadCharactersComics()
            viewModel.loadCharactersEvents()
            viewModel.loadCharactersSeries()
        }
    }
    
    func getDescription(character : MarvelCharacterItem) -> some View {
        VStack(alignment:.leading,spacing: 10) {
            
            Text("Descrirption")
                .font(.title2)
                .foregroundColor(.white)
                .frame(alignment: .leading)
            
            Text(character.description)
                .font(.title2)
                .foregroundColor(.white)
        }
    }
    
    func getComics()  -> some View {
        
        ScrollView(.horizontal) {
            LazyHGrid(rows:[GridItem(.flexible())] , spacing: 10, content: {
                ForEach(viewModel.characterComics) { comic in
                    ComicImageView(comic: comic)
                        .frame(width: 250,height: 250)
                }
            })
        }
        
    }
    
    func getSeries()  -> some View {
        LazyVGrid(columns: [GridItem(.flexible())], content: {
            ForEach(viewModel.characterSeries) { series in
                CharacterSeriesRowView(series: series)
            }
        })
    }
    
    func getEvents()  -> some View {
        LazyVGrid(columns: [GridItem(.flexible())], content: {
            ForEach(viewModel.characterEvents) { event in
                CharacterEventsRowView(event: event)
            }
        })
    }
    
}

#Preview {
    CharacterDetailsView(characterId: 1009351)
}
