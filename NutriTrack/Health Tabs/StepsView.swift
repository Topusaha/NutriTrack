//
//  StepsView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import SwiftUI

struct StepsView: View {
    
    let value: Double
    
    var body: some View {
        ZStack {
            Color(red:37/255, green: 37/255, blue: 37/255) // Gray box color
                .frame(width: 178, height: 140) // Height of the gray box
                .cornerRadius(10)
            
            VStack(alignment: .center) {
                HStack {
                    Image("Footsteps")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15, height: 35)
                    Image("Foot")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15, height: 35)
                }
                Spacer().frame(height: 10)
                Text("Steps")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal) // Add padding to the text
                
                
                Text("\(Int(value))")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    StepsView(value: 255.0)
}
