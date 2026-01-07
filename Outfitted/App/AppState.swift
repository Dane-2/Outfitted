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
class AppState: ObservableObject {
    @Published var session: SessionState = .loading
    
    init() {
        // Simulate initial check - in Week 1 we just set to signedOut
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.session = .signedOut
        }
    }
    
    func signIn(userId: String, email: String?) {
        session = .signedIn(UserSession(userId: userId, email: email))
    }
    
    func signOut() {
        session = .signedOut
    }
}

