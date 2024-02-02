//
//  ImageService.swift
//  MarvelComics
//
//  Created by tarek ahmed on 31/01/2024.
//

import Foundation
import SwiftUI
import Combine


class ImageService : ObservableObject {
    @Published var image: UIImage?
    var cancelable = Set<AnyCancellable>()
    private var imageNetwrokManager = ImageNetworkManager()
    
    
    init(path:String , fileExtension : String) {
        loadImage(path: path, fileExtension: fileExtension)
    }
    
    func loadImage(path:String , fileExtension : String) {
        guard let url = APIURLConfig.getImage(path: path, extension: fileExtension).url else {
            return
        }
        
        imageNetwrokManager.loadImage(url: url)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: {  [weak self] data in
                self?.image = UIImage(data: data)
            }
            .store(in: &cancelable)
    }
    
    
    
}
