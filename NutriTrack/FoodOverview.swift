//
//  FoodOverview.swift
//  NutriTrack
//
//  Created by Topu Saha on 4/27/24.
//

import SwiftUI

struct FoodOverview: View {
    
    

    
    var body: some View {
        
            NavigationView {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        FoodSummaryHeadingView()
                        MacroView(value: 200.0, goalValue: 2000.0)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                            .padding(.top, 20)
                        MealsView()
                           
                        
                    }
                    
                    
                }
            }
            .navigationViewStyle(StackNavigationViewStyle()) // Required for navigation bar color to take effect on iOS 14 and later
        
        
        
        
        
        
        
    }
    
   
    
}

#Preview {
    FoodOverview()
}
