//
//  ProfileView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color.black
                        .ignoresSafeArea()
                }
    }
}

#Preview {
    ProfileView()
}
