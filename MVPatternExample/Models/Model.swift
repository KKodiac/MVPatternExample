//
//  Model.swift
//  MVPatternExample
//
//  Created by Sean Hong on 2023/04/09.
//

import Foundation

@MainActor
class Model: ObservableObject {
    @Published var image: URL?
    
    let service = NetworkService()
    
    func getRandomCatImage() async throws {
        let imageURL = try await service.getRandomImage(type: .cat)
        self.image = imageURL
    }
    
    func getRandomCatGIF() async throws {
        let imageURL = try await service.getRandomGIF(type: .cat)
        self.image = imageURL
    }
    
    func getRandomDogImage() async throws {
        let imageURL = try await service.getRandomImage(type: .dog)
        self.image = imageURL
    }
}


