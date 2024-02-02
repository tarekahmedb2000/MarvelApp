//
//  ComicImageView.swift
//  MarvelComics
//
//  Created by tarek ahmed on 27/01/2024.
//

import SwiftUI

struct ComicImageView: View {
    @StateObject var viewModel: ImageViewModel
    var comic: Comic
    init(comic:Comic) {
        self.comic = comic
        _viewModel = StateObject(wrappedValue: ImageViewModel(path: comic.thumbnail.path, fileExtension: comic.thumbnail.extensionType))
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150,height: 150)
                    .clipShape(
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    )
            }
            
            Text(comic.title)
                .font(.headline)
                .lineLimit(2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    
    }
}



#Preview {
    
    let comic = Comic(id: 1, title: "example", textObjects :[TextObject(type: "", language: "", text: "hello")], thumbnail: MarvelThumbnail(path:"http://i.annihil.us/u/prod/marvel/i/mg/b/d0/4badb223f33c9" , extensionType: "jpg"))
    
    return ComicImageView(comic: comic)
}
