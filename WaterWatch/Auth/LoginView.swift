//
//  LoginView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            VStack() {
                Text("WaterWatch Login")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                Image("WaterWatchLogo")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 40)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Email or Username", text: $userInfo.username)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $userInfo.password)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding([.leading, .trailing], 27.5)
                
                Button(action: {
                    Auth.auth().signIn(withEmail: userInfo.username, password: userInfo.password) { user, error in
                        if let _ = user {
                            userInfo.loggedIn = true
                            viewState = .home
                        } else {
                            print(error?.localizedDescription ?? "")
                        }
                    }
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 30).padding(.bottom, 20)
                Spacer()
                Button(action: {
                    viewState = .forgotPassword
                }) {
                    Text("Forgot Password?")
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.watery, .sandy]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
            VStack {
                HStack {
                    Button(action: {
                        viewState = .authentication
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.padding(.leading, 20)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewState: Binding.constant(.login))
    }
}
