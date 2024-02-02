//
//  CharacterEventsRowView.swift
//  MarvelComics
//
//  Created by tarek ahmed on 31/01/2024.
//

import Foundation

import Foundation

import SwiftUI

struct CharacterEventsRowView: View {
    @StateObject var viewModel: ImageViewModel
    var event: Event
    init(event:Event) {
        self.event = event
        _viewModel = StateObject(wrappedValue: ImageViewModel(path: event.thumbnail.path, fileExtension: event.thumbnail.extensionType))
    }
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150,height: 150)
                    .clipShape(
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    )
            }
            
            Text(event.title)
                .font(.headline)
                .lineLimit(2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    
    }
}



//#Preview {
//    
//    let event = Event(id: 1, title: "example",
//                      description: "",
//                      start: Date(),
//                      end: Date(),
//                      thumbnail: MarvelThumbnail(path:"http://i.annihil.us/u/prod/marvel/i/mg/b/d0/4badb223f33c9" , extensionType: "jpg"))
//    
//    return CharacterEventsRowView(event: event)
//}


