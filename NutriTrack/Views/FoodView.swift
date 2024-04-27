//
//  FoodView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import SwiftUI

struct FoodView: View {
    var body: some View {
        Text("Food View")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color.black
                        .ignoresSafeArea()
                }
    }
}

#Preview {
    FoodView()
}
