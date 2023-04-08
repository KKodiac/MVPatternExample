//
//  NetworkService.swift
//  MVPatternExample
//
//  Created by Sean Hong on 2023/04/09.
//

import Foundation

enum NetworkServiceError: Error {
    case invalidURL
}

class NetworkService {
    let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func getRandomCatImage() async throws -> URL {
        guard let url = URL(string: "/cat", relativeTo: self.baseURL) else {
            throw NetworkServiceError.invalidURL
        }
        
        let (imagePath, _) = try await URLSession.shared.download(from: url)
        
        return imagePath
    }
    
    func getRandomCatGIF() async throws -> URL {
        guard let url = URL(string: "/cat/gif", relativeTo: self.baseURL) else {
            throw NetworkServiceError.invalidURL
        }
        
        let (imagePath, _) = try await URLSession.shared.download(from: url)
        
        return imagePath
    }
}
