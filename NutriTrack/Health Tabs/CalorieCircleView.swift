//
//  ProgressCircleView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import Foundation
import SwiftUI

struct CalorieCircleView: View {
    
    var title: String = "Calories"
    var value: Double
    var goalValue: Double
    var unit: String = "kCal"
    
    var body: some View {
        ZStack {
            Color(red:0/255, green: 55/255, blue: 126/255) // Gray box color
                .frame(width: 178, height: 199) // Height of the gray box
                .cornerRadius(10)
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    Image(systemName: "flame")
                        .foregroundColor(Color(red:253/255, green: 207/255, blue: 88/255))
                        .font(.system(size: 25))
                }
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
                    VStack {
                        Text("\(Int(value))")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                        Text("\(unit)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    CalorieCircleView(value: 200.0, goalValue: 500.0)
}

