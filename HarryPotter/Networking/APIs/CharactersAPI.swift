//
//  CharactersAPI.swift
//  HarryPotter
//
//  Created by Nilay Keven on 28.10.2020.
//

import Foundation

enum CharactersAPI: EndpointType {
    
    case getCharacters
    
    var baseURL: URL {
        var urlComponent = URLComponents()
        urlComponent.host = Constants.baseHost
        urlComponent.scheme = Constants.scheme
        urlComponent.path = path
        guard let url = urlComponent.url else { return URL.init(string: "")!}
        return url
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/api/characters"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var httpHeaders: [HTTPHeader] {
        switch self {
        default:
            return []
        }
    }
}
