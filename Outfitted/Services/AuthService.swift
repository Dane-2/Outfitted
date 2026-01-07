//
//  AuthService.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import Foundation
import Supabase

/// Protocol defining authentication operations
protocol AuthServicing {
    func currentUserSession() async -> UserSession?
    func signUp(email: String, password: String) async throws -> UserSession
    func signIn(email: String, password: String) async throws -> UserSession
    func signOut() async throws
}

/// Supabase-based authentication service implementation
final class SupabaseAuthService: AuthServicing {
    private let client: SupabaseClient
    
    init(client: SupabaseClient = SupabaseClientProvider.shared.client) {
        self.client = client
    }
    
    func currentUserSession() async -> UserSession? {
        do {
            let session = try await client.auth.session
            return mapToUserSession(session: session)
        } catch {
            // No active session
            return nil
        }
    }
    
    func signUp(email: String, password: String) async throws -> UserSession {
        let response = try await client.auth.signUp(
            email: email,
            password: password
        )
        
        guard let user = response.user else {
            throw AuthError.noUserInResponse
        }
        
        return UserSession(
            userId: user.id.uuidString,
            email: user.email
        )
    }
    
    func signIn(email: String, password: String) async throws -> UserSession {
        let response = try await client.auth.signIn(
            email: email,
            password: password
        )
        
        guard let user = response.user else {
            throw AuthError.noUserInResponse
        }
        
        return UserSession(
            userId: user.id.uuidString,
            email: user.email
        )
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
    }
    
    // MARK: - Helper Methods
    
    private func mapToUserSession(session: Session) -> UserSession {
        return UserSession(
            userId: session.user.id.uuidString,
            email: session.user.email
        )
    }
}

// MARK: - Errors

enum AuthError: LocalizedError {
    case noUserInResponse
    
    var errorDescription: String? {
        switch self {
        case .noUserInResponse:
            return "Authentication response did not include user information"
        }
    }
}

