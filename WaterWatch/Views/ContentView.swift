//
//  ContentView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//
import SwiftUI
import UserNotifications
import FirebaseAuth

enum ViewState{
    case home, authentication, signUp, login, forgotPassword, settings, survey
}

struct ContentView: View {
    
    @State var viewState: ViewState = ViewState.authentication
    @EnvironmentObject var userInfo: UserInfo
    @State private var tabSelected: Tab = .house
    
    var body: some View {
        if viewState == .authentication && !userInfo.loggedIn {
            AuthenticationView(viewState: $viewState)
        } else if viewState == .login && !userInfo.loggedIn {
            LoginView(viewState: $viewState)
        } else if viewState == .signUp && !userInfo.loggedIn {
            SignUpView(viewState: $viewState)
        } else if viewState == .forgotPassword && !userInfo.loggedIn {
            ForgotPassword(viewState: $viewState)
        } else if viewState == .survey && userInfo.loggedIn {
            SurveryView(viewState: $viewState)
        } else {
            ZStack {
                VStack {
                    TabView(selection: $tabSelected) {
                        if(tabSelected == .house) {
                            HomeView(viewState: $viewState)
                        } else if (tabSelected == .gearshape) {
                            SettingsView(viewState: $viewState)
                        }
                    }
                }
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $tabSelected)
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
