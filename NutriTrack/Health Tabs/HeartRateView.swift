//
//  HeartRateView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import SwiftUI

struct HeartRateView: View {
    
    let value: String
    
    var body: some View {
        ZStack {
            Color(red:37/255, green: 37/255, blue: 37/255) // Gray box color
                .frame(width: 178, height: 199) // Height of the gray box
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Spacer().frame(height: 5)
                Text("Heart Rate")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal) // Add padding to the text
                Image(systemName: "heart")
                    .foregroundColor(.red)
                    .font(.system(size: 150)) // Set font size to make the heart bigger
            }

            HStack {
                Text(value)
                    .font(.title)
                    .foregroundColor(.white)
                Text("BPM")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    HeartRateView(value: "57")
}
