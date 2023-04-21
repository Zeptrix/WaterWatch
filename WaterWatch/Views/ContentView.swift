//
//  ContentView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//
import SwiftUI
import UserNotifications
import FirebaseAuth
import FirebaseDatabase

enum ViewState{
    case home, authentication, signUp, login, forgotPassword, settings, survey, newaccount
}

struct ContentView: View {
    
    @State var viewState: ViewState = ViewState.authentication
    @EnvironmentObject var userInfo: UserInfo
    @State private var tabSelected: Tab = .house
    @State var isActive: Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            if viewState == .authentication && !userInfo.loggedIn {
                AuthenticationView(viewState: $viewState)
            } else if viewState == .login && !userInfo.loggedIn {
                LoginView(viewState: $viewState)
            } else if viewState == .signUp && !userInfo.loggedIn {
                SignUpView(viewState: $viewState)
            } else if viewState == .forgotPassword && !userInfo.loggedIn {
                ForgotPassword(viewState: $viewState)
            } else if viewState == .newaccount && userInfo.loggedIn {
                NewAccountView(viewState: $viewState)
            } else {
                ZStack {
                    VStack {
                        TabView(selection: $tabSelected) {
                            if(tabSelected == .house) {
                                HomeView(viewState: $viewState)
                            } else if (tabSelected == .gearshape) {
                                SettingsView(viewState: $viewState)
                            } else if (tabSelected == .doc) {
                                SurveyView(viewState: $viewState)
                            }
                        }
                    }
                    VStack {
                        Spacer()
                        CustomTabBar(selectedTab: $tabSelected)
                    }
                }
            }
        } else {
            VStack {
                VStack {
                    Image("WaterWatchLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 128, height: 128)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 5.0, x: 10, y: 5)
                    
                    Text("WaterWatch")
                        .font(.largeTitle)
                        .foregroundColor(.black.opacity(0.80))
                }
                .padding(.bottom, 100)
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 1.25
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                        if(userInfo.loggedIn) {
                            Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
                                guard let uid = Auth.auth().currentUser?.uid else {return}
                                Database.database().reference().child("users/\(uid)").setValue(userInfo.dictionary)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
