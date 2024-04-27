//
//  NutriTrackApp.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/22/24.
//

import SwiftUI
import FirebaseCore

@main
struct NutriTrackApp: App {
    
    @State private var authManager: AuthManager // <-- Create a state managed authManager property
    
    init() { // <-- Add an init
                FirebaseApp.configure() // <-- Configure Firebase app
                authManager = AuthManager() // <-- Initialize the authManager property (needs to be done after FirebaseApp.configure())
            }
    
    var body: some Scene {
        WindowGroup {
            if authManager.user != nil { // <-- Check if you have a non-nil user (means there is a logged in user)

                // We have a logged in user, go to ChatView
                Tab() // <-- Add ChatView
                    .environment(authManager) // <-- Pass authManager to the environment
            } else {

                // No logged in user, go to LoginView
                ContentView()
                    .environment(authManager)
            }
        }
    }
}
