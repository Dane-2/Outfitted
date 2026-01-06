//
//  ProfileView.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    
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
                        appState.signOut()
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
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AppState())
}

