//
//  AuthFlowView.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import SwiftUI

struct AuthFlowView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var vm = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                
                // App branding
                VStack(spacing: 8) {
                    Image(systemName: "tshirt.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.blue)
                    
                    Text("Outfitted")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Your personal style assistant")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                // Auth buttons
                VStack(spacing: 16) {
                    Button(action: {
                        // Placeholder for sign in
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .cornerRadius(12)
                    }
                    
                    Button(action: {
                        // Placeholder for create account
                    }) {
                        Text("Create Account")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .foregroundStyle(.blue)
                            .cornerRadius(12)
                    }
                    
                    // Mock sign in for testing
                    Divider()
                        .padding(.vertical)
                    
                    Button(action: {
                        appState.signIn(userId: "debug-user", email: "debug@outfitted.app")
                    }) {
                        Text("Mock Sign In (Debug)")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green.opacity(0.1))
                            .foregroundStyle(.green)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 48)
            }
            .navigationTitle("")
        }
    }
}

#Preview {
    AuthFlowView()
        .environmentObject(AppState())
}

