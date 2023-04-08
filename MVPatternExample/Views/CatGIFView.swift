//
//  CatGIFView.swift
//  MVPatternExample
//
//  Created by Sean Hong on 2023/04/09.
//

import SwiftUI
import SwiftyGif

struct CatGIFView: View {
    @EnvironmentObject private var model: Model
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AnimatedGifView(url: $model.image)
                Button("New Cat!") {
                    Task {
                        do {
                            try await model.getRandomCatGIF()
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
                try await model.getRandomCatGIF()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct AnimatedGifView: UIViewRepresentable {
    @Binding var url: URL?

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView(gifURL: self.url!)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.setGifFromURL(self.url!)
    }
}

struct CatGIFView_Previews: PreviewProvider {
    static var previews: some View {
        CatGIFView()
            .environmentObject(Model(service: NetworkService(baseURL: URL(string: "https://cataas.com/")!)))
    }
}
