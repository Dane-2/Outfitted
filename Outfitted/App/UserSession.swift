//
//  UserSession.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import Foundation

/// Represents the current authentication state
enum SessionState {
    case loading
    case signedOut
    case signedIn(UserSession)
}

/// User session data
struct UserSession {
    let userId: String
    let email: String?
}

