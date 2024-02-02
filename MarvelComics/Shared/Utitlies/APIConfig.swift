//
//  APIConfig.swift
//  MarvelComics
//
//  Created by tarek ahmed on 25/01/2024.
//

import Foundation


enum APIAuthParams {
    private static let publicAPIkey = "bc976714e55c5c11dbdf7a7ff7f5cc86"
    private static let privateAPIkey = "893c310131859a166c9374a7b1e6d7c9b8317299"
    private static let timestamp = Date().timeIntervalSince1970.description
    private static let hash =  "\(timestamp)\(privateAPIkey)\(publicAPIkey)".md5
    
    case publicAPIKeyQueryitem
    case timeStampQueryitem
    case hashQueryitem
    
    var queryItem : URLQueryItem {
        switch self {
        case .publicAPIKeyQueryitem:
            return URLQueryItem(name: "apikey", value: Self.publicAPIkey)
        case .timeStampQueryitem:
            return  URLQueryItem(name: "ts", value: Self.timestamp)
        case .hashQueryitem:
            return  URLQueryItem(name: "hash", value: Self.hash)
        }
    }
    
}


enum APIURLConfig {
    static let baseUrl = "https://gateway.marvel.com:443/v1/public/"
    static let imageSize = "portrait_xlarge"
    
    case getCharacterList
    case getImage(path:String, extension: String)
    case getCharacterDetails(characterId:Int)
    case getCharacterComics(characterId:Int)
    case getCharacterEvents(characterId:Int)
    case getCharacterSeries(characterId:Int)
     
    private var urlText : String {
        switch self {
        case .getCharacterList:
            return Self.baseUrl + "characters" + "?"
        case .getImage(let path,let fileExtension):
            return path + "/" + Self.imageSize + "." + fileExtension
        case .getCharacterDetails(let characterId):
            return Self.baseUrl + "characters" + "/" + "\(characterId)"
        case .getCharacterComics(let characterId):
            return Self.baseUrl + "characters" + "/" + "\(characterId)" + "/" + "comics"
        case .getCharacterEvents(let characterId):
            return Self.baseUrl + "characters" + "/" + "\(characterId)" + "/" + "events"
        case .getCharacterSeries(let characterId):
            return Self.baseUrl + "characters" + "/" + "\(characterId)" + "/" + "series"
            
        }
    }
    
    var url: URL? {
        
        switch self {
       
        case .getImage:
            return URL(string: urlText)
            
        default :
            return URL(string: urlText)?.appending(queryItems: [
                APIAuthParams.publicAPIKeyQueryitem.queryItem,
                APIAuthParams.timeStampQueryitem.queryItem,
                APIAuthParams.hashQueryitem.queryItem,
            ])
        }
        
    }
    
}




