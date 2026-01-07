//
//  AppState.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import Foundation
import SwiftUI

/// Main application state managing authentication and user session
@MainActor
final class AppState: ObservableObject {
    @Published var session: SessionState = .loading
    
    private let authService: AuthServicing
    
    init(authService: AuthServicing = SupabaseAuthService()) {
        self.authService = authService
        self.session = .loading
        
        Task {
            await bootstrap()
        }
    }
    
    func bootstrap() async {
        if let userSession = await authService.currentUserSession() {
            session = .signedIn(userSession)
        } else {
            session = .signedOut
        }
    }
    
    func signUp(email: String, password: String) async throws {
        let userSession = try await authService.signUp(email: email, password: password)
        session = .signedIn(userSession)
    }
    
    func signIn(email: String, password: String) async throws {
        let userSession = try await authService.signIn(email: email, password: password)
        session = .signedIn(userSession)
    }
    
    func signOut() async throws {
        try await authService.signOut()
        session = .signedOut
    }
}

