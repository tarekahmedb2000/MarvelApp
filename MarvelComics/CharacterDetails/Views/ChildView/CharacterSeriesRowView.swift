//
//  CharacterSeriesRowView.swift
//  MarvelComics
//
//  Created by tarek ahmed on 31/01/2024.
//

import Foundation

import SwiftUI

struct CharacterSeriesRowView: View {
    @StateObject var viewModel: ImageViewModel
    var series: Series
    init(series:Series) {
        self.series = series
        _viewModel = StateObject(wrappedValue: ImageViewModel(path: series.thumbnail.path, fileExtension: series.thumbnail.extensionType))
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
            
            Text(series.title)
                .font(.headline)
                .lineLimit(2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    
    }
}





