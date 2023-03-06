//
//  ContentView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//

import SwiftUI

enum ViewState{
    case home, authentication, signUp, login, forgotPassword
}

struct ContentView: View {
    
    @State var viewState: ViewState = ViewState.authentication
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        if viewState == .authentication && !userInfo.loggedIn {
            AuthenticationView(viewState: $viewState)
        } else if viewState == .login && !userInfo.loggedIn {
            LoginView(viewState: $viewState)
        } else if viewState == .signUp && !userInfo.loggedIn {
            SignUpView(viewState: $viewState)
        } else if viewState == .forgotPassword && !userInfo.loggedIn {
            ForgotPassword(viewState: $viewState)
        } else {
            HomeView(viewState: $viewState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
