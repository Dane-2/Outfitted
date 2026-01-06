//
//  OutfittedApp.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import SwiftUI

@main
struct OutfittedApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
        }
    }
}

