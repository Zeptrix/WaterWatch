//
//  AuthenticationView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                Button(action: {
                    viewState = .signUp
                }) {
                    Text("Sign Up")
                        .font(.title2)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                        .foregroundColor(Color.blue)
                }
                
                Button(action: {
                    viewState = .login
                }) {
                    Text("Login")
                        .font(.title2)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                        .foregroundColor(Color.blue)
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(viewState: Binding.constant(.authentication))
    }
}
