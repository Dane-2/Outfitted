//
//  RootView.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch appState.session {
        case .loading:
            ProgressView("Loading...")
                .progressViewStyle(.circular)
                
        case .signedOut:
            AuthFlowView()
                
        case .signedIn:
            MainTabView()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AppState())
}

