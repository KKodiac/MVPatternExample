//
//  MVPatternExampleApp.swift
//  MVPatternExample
//
//  Created by Sean Hong on 2023/04/09.
//

import SwiftUI

@main
struct MVPatternExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Model())
        }
    }
}
