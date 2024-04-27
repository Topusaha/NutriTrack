//
//  WaterView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import SwiftUI

struct WaterView: View {
    var body: some View {
        Text("Water View")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color.black
                        .ignoresSafeArea()
                }
    }
}

#Preview {
    WaterView()
}
