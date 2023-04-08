//
//  MVPatternExampleApp.swift
//  MVPatternExample
//
//  Created by Sean Hong on 2023/04/09.
//

import SwiftUI

@main
struct MVPatternExampleApp: App {
    let url = URL(string: "https://cataas.com/")!
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Model(service: NetworkService(baseURL: url)))
        }
    }
}
