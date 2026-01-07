//
//  ProfileView.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    @State private var signOutError: String?
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    if case .signedIn(let userSession) = appState.session {
                        HStack {
                            Text("User ID")
                                .foregroundStyle(.secondary)
                            Spacer()
                            Text(userSession.userId)
                        }
                        
                        if let email = userSession.email {
                            HStack {
                                Text("Email")
                                    .foregroundStyle(.secondary)
                                Spacer()
                                Text(email)
                            }
                        }
                    }
                } header: {
                    Text("Account")
                }
                
                Section {
                    Button(role: .destructive, action: {
                        Task {
                            do {
                                try await appState.signOut()
                            } catch {
                                signOutError = error.localizedDescription
                            }
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text("Sign Out")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .alert("Sign Out Error", isPresented: .constant(signOutError != nil)) {
                Button("OK") {
                    signOutError = nil
                }
            } message: {
                if let signOutError = signOutError {
                    Text(signOutError)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AppState())
}

