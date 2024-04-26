//
//  HomeView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/22/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            Image("PushUps") // Replace "fitness_image" with your fitness image asset
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding(.horizontal)
            
            VStack {
                
                Text("Commit to your                                    workout and watch                                 your goals take                          shape")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .padding(.top, 20)
            Spacer().frame(height: 60)
            
            NavigationLink(destination: SignupView()) {
                Text("Create Account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 295, height: 50)
                    .background(Color(red: 0, green: 55/255, blue: 126/255))
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            NavigationLink(destination: LoginView()) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 295, height: 50)
                    .background(Color.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Create rounded rectangle overlay
                            .stroke(Color.white, lineWidth: 2) // Add stroke (outline) to the rounded rectangle
                    )
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.black
                    .ignoresSafeArea()
            }
        
    }
}

#Preview {
    HomeView()
}
