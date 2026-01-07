//
//  SupabaseClientProvider.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import Foundation
import Supabase

/// Centralized provider for Supabase client instance
final class SupabaseClientProvider {
    static let shared = SupabaseClientProvider()
    
    let client: SupabaseClient
    
    private init() {
        let config = SupabaseConfig.load()
        
        #if DEBUG
        print("✅ Supabase configured for \(config.url.absoluteString)")
        #endif
        
        self.client = SupabaseClient(
            supabaseURL: config.url,
            supabaseKey: config.anonKey
        )
    }
}

