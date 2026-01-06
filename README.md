# Outfitted - Week 1 Skeleton

A personal style assistant iOS app built with SwiftUI and MVVM architecture.

## Project Structure

```
Outfitted/
├── App/
│   ├── OutfittedApp.swift    # Main app entry point
│   ├── AppState.swift         # Global app state management
│   ├── RootView.swift         # Root navigation controller
│   └── MainTabView.swift      # Main tab bar interface
├── Auth/
│   └── AuthFlowView.swift     # Authentication flow (mock sign in)
├── Closet/
│   └── ClosetView.swift       # Closet management view
├── Outfits/
│   └── OutfitsView.swift      # Outfit generation view
├── Profile/
│   └── ProfileView.swift      # User profile view
├── Services/                   # (Empty - for future services)
├── Models/                     # (Empty - for future data models)
├── Shared/                     # (Empty - for shared components)
└── Resources/
    └── Assets.xcassets        # App assets and images
```

## Features

### Week 1 Implementation

- ✅ Clean MVVM architecture
- ✅ SwiftUI navigation with TabView
- ✅ Mock authentication flow
- ✅ Three main sections: Closet, Outfits, Profile
- ✅ Dependency injection via EnvironmentObject
- ✅ iOS 17+ support

### Authentication

- Mock sign in/sign out functionality
- Session state management (loading, signedOut, signedIn)
- Debug user: `debug@outfitted.app`

### Navigation Flow

1. **Loading** → Shows progress indicator
2. **Signed Out** → Auth flow with mock sign in
3. **Signed In** → Main tab interface

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Getting Started

1. Open `Outfitted.xcodeproj` in Xcode
2. Select a simulator or device (iOS 17+)
3. Build and run (⌘R)
4. Tap "Mock Sign In (Debug)" to access the app
5. Navigate between tabs: Closet, Outfits, Profile
6. Tap "Sign Out" in Profile to return to auth flow

## Architecture

### AppState

Central observable object managing authentication state:
- `SessionState`: Enum representing loading, signedOut, or signedIn states
- `UserSession`: Struct containing userId and email
- Methods for sign in/out

### Views

- **RootView**: Switches views based on session state
- **AuthFlowView**: Authentication interface with mock sign in
- **MainTabView**: Tab-based navigation container
- **ClosetView**: Placeholder for closet management
- **OutfitsView**: Placeholder for outfit generation
- **ProfileView**: User profile with sign out

### Dependency Injection

All views receive `AppState` via `@EnvironmentObject`, injected at the app level.

## Next Steps

- Implement Supabase authentication
- Add data models for clothing items and outfits
- Implement closet item management
- Add outfit generation logic
- Integrate image handling for clothing items

## Notes

- No third-party libraries in Week 1
- All code compiles and runs
- Clean, minimal implementation
- Ready for Supabase integration

