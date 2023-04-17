//
//  AuthenticationView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack() {
            Rectangle()
                .opacity(0)
                .background(LinearGradient(gradient: Gradient(colors: [.watery, .sandy]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
            VStack() {
                Text("WaterWatch")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding([.top, .bottom], 40)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                Image("WaterWatchLogo")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    Button(action: {
                        viewState = .signUp
                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.cyan)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }.padding(.bottom, 5)
                    
                    Button(action: {
                        viewState = .login
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }
                    
                }.padding([.leading, .trailing], 27.5)
                                
                HStack {
                    Text("New around here? ")
                        .foregroundColor(.white)
                    Button(action: {
                        viewState = .signUp
                    }) {
                        Text("Sign Up")
                            .foregroundColor(Color.green)
                    }
                }.padding([.top, .bottom], 50)
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(viewState: Binding.constant(.authentication))
    }
}
