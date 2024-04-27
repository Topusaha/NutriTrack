//
//  MealsView.swift
//  NutriTrack
//
//  Created by Topu Saha on 4/27/24.
//

import SwiftUI

struct MealsView: View {
    
    
    @State private var result = [Nutrition]()
    @State private var enteredFood : String = ""

    
    var body: some View {
            NavigationView {
                ZStack {
                    Color.black.ignoresSafeArea()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Meals")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        
                        ScrollView {
                            VStack(alignment: .leading) {
                                ForEach(result, id: \.self) { item in
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text("Calories: \(item.calories)")
                                    }
                                    .padding(.vertical, 8)
                                }
                            }
                        }
                        .frame(height: 200)
                        
                        HStack {
                            TextField("Enter what you ate", text: $enteredFood)
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(8)
                                .textFieldStyle(PlainTextFieldStyle())
                            
                            Button(action: {
                               
                                Task { await callAPI(food: enteredFood)
                                }
                                print(self.result)
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                
                }
                .navigationBarHidden(true)
            }
        }
    
    
    //API Call
    private func callAPI(food : String) async {
        let query = food.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let url = URL(string: "https://api.api-ninjas.com/v1/nutrition?query="+query!)!
            var request = URLRequest(url: url)
            request.setValue("CoGoxCyj4fSBJiUQFo/OjA==YPeYhNjRKFXrSSHQ", forHTTPHeaderField: "X-Api-Key")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                result = try JSONDecoder().decode([Nutrition].self, from: data)
                
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
}

#Preview {
    MealsView()
}
