//
//  NetworkService.swift
//  MVPatternExample
//
//  Created by Sean Hong on 2023/04/09.
//

import Foundation

enum NetworkServiceError: Error {
    case invalidURL, invalidAPI
}

enum ImageType {
    case dog, cat
    
    var baseURLPath: String {
        switch self {
        case .cat:
            return "https://cataas.com/"
        case .dog:
            return "https://dog.ceo/"
        }
    }
    
    var randomImageURLPath: String {
        switch self {
        case .cat:
            return "/cat"
        case .dog:
            return "/api/breeds/image/random"
        }
    }
    
    var randomGIFURLPath: String? {
        switch self {
        case .cat:
            return "/cat/gif"
        default:
            return nil
        }
    }
}

class NetworkService {
    func getRandomImage(type: ImageType) async throws -> URL? {
        if let baseURL = URL(string: type.baseURLPath) {
            guard let url = URL(string: type.randomImageURLPath, relativeTo: baseURL) else {
                throw NetworkServiceError.invalidURL
            }
            
            let (imageURL, _) = try await URLSession.shared.download(from: url)
            return imageURL
        }
        return nil
    }
    
    func getRandomGIF(type: ImageType) async throws -> URL? {
        if let baseURL = URL(string: type.baseURLPath),
           let prefixPath = type.randomGIFURLPath {
            guard let url = URL(string: prefixPath, relativeTo: baseURL) else {
                throw NetworkServiceError.invalidURL
            }
            
            let (imageURL, _) = try await URLSession.shared.download(from: url)
            return imageURL
        } else {
            throw NetworkServiceError.invalidAPI
        }
    }
}
