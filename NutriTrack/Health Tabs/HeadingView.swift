//
//  HeadingView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import SwiftUI

struct HeadingView: View {
    
    @State var name: String
    
    var body: some View {
        ZStack {
            Color(.black) // Gray box color
                .frame(width: 400, height: 100) // Height of the gray box
                .cornerRadius(10)
            HStack {
                Image("Running") // Use the provided image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 57, height: 57) // Set the size of the image
                    .clipShape(Circle()) // Clip the image to a circle shape
                    .overlay(Circle().stroke(Color.white, lineWidth: 2)) // Add a white border
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2) // Add a drop shadow
                Spacer().frame(width: 20)
                VStack {
                    Text("Welcome Back!!!")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Text("Mr.\(name)")
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
    
    HeadingView(name: "Fugazi")
}
