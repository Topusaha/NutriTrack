//
//  Tab.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import SwiftUI

struct Tab: View {
    
    @State private var selection = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                HealthOverview()
                    .tabItem {
                        CustomTabItem(systemImage: "figure.run", isSelected: selection == 0)
                    }
                    .tag(0)
                FoodView()
                    .tabItem {
                        CustomTabItem(systemImage: "fork.knife", isSelected: selection == 1)
                    }
                    .tag(1)
                WaterView()
                    .tabItem {
                        CustomTabItem(systemImage: "drop.fill", isSelected: selection == 2)
                    }
                    .tag(2)
                ProfileView()
                    .tabItem {
                        CustomTabItem(systemImage: "person.circle.fill", isSelected: selection == 3)
                    }
                    .tag(3)
            }
            .accentColor(.white) // Set tab item icon color to white
            .onAppear {
                UITabBar.appearance().barTintColor = .black // Set tab bar background color to black
            }
        }
    }
}

struct CustomTabItem: View {
    let systemImage: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            ZStack {
                Image(systemName: systemImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(isSelected ? .blue : .white) // Set icon color to blue when selected
                if isSelected {
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue) // Blue box around the selected icon
                } else {
                    Spacer().frame(height: 5) // Spacer to maintain layout
                }
            }
        }
    }
}

#Preview {
    Tab()
}
