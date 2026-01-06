//
//  OutfitsView.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import SwiftUI

struct OutfitsView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(systemName: "sparkles")
                    .font(.system(size: 60))
                    .foregroundStyle(.secondary)
                
                Text("No outfits yet")
                    .font(.headline)
                    .padding(.top, 8)
                
                Text("Generate your first outfit")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 24)
                
                Button(action: {
                    // Placeholder for generate outfit functionality
                }) {
                    Text("Generate Outfit")
                        .font(.headline)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                }
                
                Spacer()
            }
            .navigationTitle("Outfits")
        }
    }
}

#Preview {
    OutfitsView()
        .environmentObject(AppState())
}

