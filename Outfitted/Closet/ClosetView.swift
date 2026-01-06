//
//  ClosetView.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import SwiftUI

struct ClosetView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(systemName: "tshirt")
                    .font(.system(size: 60))
                    .foregroundStyle(.secondary)
                
                Text("Your closet is empty")
                    .font(.headline)
                    .padding(.top, 8)
                
                Text("Add items to get started")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            .navigationTitle("Closet")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        // Placeholder for add item functionality
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ClosetView()
        .environmentObject(AppState())
}

