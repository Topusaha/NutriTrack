//
//  SleepCircleView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/26/24.
//

import Foundation
import SwiftUI

struct SleepCircleView: View {
    
    var title: String = "Sleep"
    var value: Double
    var goalValue: Double
    var unit: String = "Hours"
    
    var body: some View {
        ZStack {
            Color(red:37/255, green: 37/255, blue: 37/255) // Gray box color
                .frame(width: 178, height: 140) // Height of the gray box
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                HStack {
                    VStack{
                        Text("\(Int(value)) / \(Int(goalValue))")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                        Text("\(unit)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                            .bold()
                    }
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 10)
                            .opacity(0.3)
                            .foregroundColor(.gray)
                        Circle()
                            .trim(from: 0.0, to: CGFloat(min((value) / goalValue, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.white)
                            .rotationEffect(Angle(degrees: 270))
                            .animation(.linear, value: value)
                    }
                    .frame(width: 73, height: 69)
                }
            }
        }
    }
}

#Preview {
    SleepCircleView(value: 5.0, goalValue: 8.0)
}


