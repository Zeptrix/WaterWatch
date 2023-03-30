//
//  ForgotPassword.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//

import SwiftUI
import FirebaseAuth

struct ForgotPassword: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack() {
            Rectangle()
                .opacity(0)
                .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button(action: {
                        viewState = .login
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.padding(.leading, 20)
                Spacer()
            }
            VStack {
                Text("Forgot Password")
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
                    TextField("Email or Username", text: $userInfo.username)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding([.leading, .trailing], 27.5)
                Button {
                    Auth.auth().sendPasswordReset(withEmail: userInfo.username) { _ in
                        self.viewState = .authentication
                    }
                } label: {
                    Text("Forgot Password").font(Constants.buttonFont)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 30)
                Spacer()
            }
        }
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword(viewState: Binding.constant(.signUp))
    }
}
