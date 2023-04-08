//
//  CatImageView.swift
//  MVPatternExample
//
//  Created by Sean Hong on 2023/04/09.
//

import SwiftUI

struct CatImageView: View {
    @EnvironmentObject private var model: Model
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AsyncImage(url: model.image) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                
                Button("New Cat!") {
                    Task {
                        do {
                            try await model.getRandomCatImage()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .task {
            do {
                try await model.getRandomCatImage()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct CatImageView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView()
            .environmentObject(Model(service: NetworkService(baseURL: URL(string: "https://cataas.com/")!)))
    }
}
