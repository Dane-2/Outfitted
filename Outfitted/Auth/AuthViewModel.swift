//
//  AuthViewModel.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import Foundation
import SwiftUI

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var mode: AuthMode = .signIn
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    enum AuthMode {
        case signIn
        case signUp
    }
    
    func submit(appState: AppState) async {
        isLoading = true
        errorMessage = nil
        
        // Validate inputs
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password"
            isLoading = false
            return
        }
        
        do {
            switch mode {
            case .signIn:
                try await appState.signIn(email: email, password: password)
            case .signUp:
                try await appState.signUp(email: email, password: password)
            }
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = readableErrorMessage(from: error)
        }
    }
    
    private func readableErrorMessage(from error: Error) -> String {
        if let authError = error as? AuthError {
            return authError.localizedDescription
        } else if let localizedError = error as? LocalizedError,
                  let description = localizedError.errorDescription {
            return description
        } else {
            return error.localizedDescription.isEmpty ? "An error occurred" : error.localizedDescription
        }
    }
}

