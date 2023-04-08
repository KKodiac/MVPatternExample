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
    
    let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func getRandomCatImage() async throws {
        let imageURL = try await service.getRandomCatImage()
        self.image = imageURL
    }
    
    func getRandomCatGIF() async throws {
        let imageURL = try await service.getRandomCatGIF()
        self.image = imageURL
    }
}
