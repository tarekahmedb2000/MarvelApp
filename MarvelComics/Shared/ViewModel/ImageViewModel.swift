//
//  ImageViewModel.swift
//  MarvelComics
//
//  Created by tarek ahmed on 31/01/2024.
//

import Foundation
import Combine
import SwiftUI

class ImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    private var dataService : ImageService
    
    init(path:String , fileExtension : String) {
        dataService = ImageService(path: path, fileExtension: fileExtension)
        loadComicImage()
    }
     
    private func loadComicImage() {
        dataService.$image
            .assign(to: &$image)
    }
    

}
