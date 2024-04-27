//
//  MacroView.swift
//  NutriTrack
//
//  Created by Topu Saha on 4/27/24.
//

import SwiftUI

struct MacroView: View {
    
    var title: String = "Calories"
    var value: Double
    var goalValue: Double
    var unit: String = "kCal"
    
    var protein: Double = 20
    var fats: Double = 23
    var carbs: Double = 75
    
    
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    
                    VStack {
                        Text("\(Int(value)) Kcal")
                            .font(.title)
                        Text("Consumed")
                    }
                    .padding(.trailing)
                    
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 10)
                            .opacity(0.3)
                            .foregroundColor(.blue)
                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(value / goalValue, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.white)
                            .rotationEffect(Angle(degrees: 270))
                            .animation(.linear, value: value)
                        
                    }
                    .frame(width: 100, height: 100)
                    
                    VStack {
                        
                        if (goalValue - value > 0) {
                            Text("\(Int(goalValue - value)) Kcal")
                                .font(.title)
                            Text("Remaining")
                        }
                        
                        else {
                            Text("\(Int(value - goalValue)) Kcal")
                                .font(.title)
                            Text("Above")
                        }
                        
                       
                    }
                    .padding(.leading)
                }
                
                
                
                // Macro View
                HStack {
                    ProgressView("P - \(Int(protein)) g", value: protein, total: 120)
                        .padding()
                        .tint(.white)
                    ProgressView("C - \(Int(carbs)) g", value: carbs, total: 325)
                        .tint(.white)
                    ProgressView("F - \(Int(fats)) g", value: fats, total: 67)
                        .tint(.white)
                    
                }
            }
            .foregroundColor(.white)
        }

    }
}

#Preview {
    MacroView(value: 800.0, goalValue: 2000.0)
}
