//
//  MainTabView.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        TabView {
            ClosetView()
                .tabItem {
                    Label("Closet", systemImage: "tshirt")
                }
            
            OutfitsView()
                .tabItem {
                    Label("Outfits", systemImage: "sparkles")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AppState())
}

