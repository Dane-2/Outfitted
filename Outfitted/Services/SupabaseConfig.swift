//
//  SupabaseConfig.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import Foundation

/// Supabase configuration loaded from plist file
struct SupabaseConfig {
    let url: URL
    let anonKey: String
    
    /// Loads configuration from SupabaseConfig.plist in the main bundle
    static func load() -> SupabaseConfig {
        guard let plistURL = Bundle.main.url(forResource: "SupabaseConfig", withExtension: "plist") else {
            fatalError("""
            ❌ SupabaseConfig.plist not found!
            
            Please create Resources/SupabaseConfig.plist by copying SupabaseConfig.template.plist
            and filling in your Supabase credentials:
            
            1. Copy: Outfitted/Resources/SupabaseConfig.template.plist
            2. Rename to: SupabaseConfig.plist
            3. Replace placeholder values with your actual Supabase URL and anon key
            
            This file is gitignored for security.
            """)
        }
        
        guard let plistData = try? Data(contentsOf: plistURL),
              let plist = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any],
              let urlString = plist["SUPABASE_URL"] as? String,
              let anonKey = plist["SUPABASE_ANON_KEY"] as? String else {
            fatalError("""
            ❌ Invalid SupabaseConfig.plist format!
            
            The plist must contain:
            - SUPABASE_URL (String): Your Supabase project URL
            - SUPABASE_ANON_KEY (String): Your Supabase anon/public key
            
            See SupabaseConfig.template.plist for the correct format.
            """)
        }
        
        guard let url = URL(string: urlString) else {
            fatalError("""
            ❌ Invalid SUPABASE_URL in SupabaseConfig.plist!
            
            The URL must be a valid HTTP/HTTPS URL.
            Current value: \(urlString)
            """)
        }
        
        guard !anonKey.isEmpty else {
            fatalError("""
            ❌ SUPABASE_ANON_KEY is empty in SupabaseConfig.plist!
            
            Please provide your Supabase anon/public key.
            """)
        }
        
        return SupabaseConfig(url: url, anonKey: anonKey)
    }
}

