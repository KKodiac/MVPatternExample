//
//  ContentView.swift
//  MVPatternExample
//
//  Created by Sean Hong on 2023/04/09.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: Model
    
    var body: some View {
        TabView {
            CatImageView()
                .environmentObject(model)
                .tabItem {
                    Label("Image", systemImage: "photo")
                }
            CatGIFView()
                .environmentObject(model)
                .tabItem {
                    Label("GIF", systemImage: "video")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model(service: NetworkService(baseURL: URL(string: "https://cataas.com/")!)))
    }
}
