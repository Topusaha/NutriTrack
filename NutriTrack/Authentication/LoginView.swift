//
//  LoginView.swift
//  NutriTrack
//
//  Created by Nathan Albe on 4/25/24.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(AuthManager.self) var authManager // <-- Access the authManager from the environment

    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            VStack {
                
                // Email + password fields
                VStack(alignment: .leading) {
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    Spacer().frame(height: 10)
                    
                    Text("Email")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    TextField("Enter your email", text: $email)
                        .frame(width: 295, height: 50)
                    
                    Text("Password")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    SecureField("Enter your password", text: $password)
                        .frame(width: 295, height: 50)
                    
                }
                .textFieldStyle(.roundedBorder) // <-- Style text fields (applies to both text fields within the VStack)
                .textInputAutocapitalization(.never) // <-- No auto capitalization (can be annoying for emails and passwords)
                
                Spacer().frame(height: 30)
                
                Button("Login") {
                    print("Login user: \(email), \(password)")
                    // TODO: Login user
                    authManager.signIn(email: email, password: password) // <-- Sign in user via authManager
                    
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 295, height: 50)
                .background(Color(red: 0, green: 55/255, blue: 126/255))
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.black
                    .ignoresSafeArea()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                    presentationMode.wrappedValue.dismiss() // Dismiss the current view
                }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
            }
        )
   }
        
}

#Preview {
    LoginView()
        .environment(AuthManager())
}
