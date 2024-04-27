//
//  FoodSummaryHeadingView.swift
//  NutriTrack
//
//  Created by Topu Saha on 4/27/24.
//

import SwiftUI

struct FoodSummaryHeadingView: View {
    var body: some View {
        ZStack {
            Color(.black) // Gray box color
                .frame(width: 400, height: 100) // Height of the gray box
                .cornerRadius(10)
            HStack {
                VStack {
                    Text("Food Summary")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                Spacer().frame(width: 100)
                Button(action: {
                    // Action to perform when the bell button is tapped
                    print("Bell button tapped!")
                }) {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27) // Adjust size as needed
                        .foregroundColor(.white)
                }
                
            }
        }
    }
}

#Preview {
    FoodSummaryHeadingView()
}

