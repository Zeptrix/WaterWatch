//
//  ContentView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//
import SwiftUI
import UserNotifications

enum ViewState{
    case home, authentication, signUp, login, forgotPassword, settings, survey
}

struct ContentView: View {
    
    @State var viewState: ViewState = ViewState.authentication
    @EnvironmentObject var userInfo: UserInfo
    @State var water_mL = 0
    @Binding var remindersPerDay: Double
    @Binding var drinkSize: Double
    
    
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
        } else if viewState == .settings && userInfo.loggedIn{
            TabView {
                HomeView(water_mL: $water_mL, viewState: $viewState)
                    .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                SettingsView(viewState: $viewState)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
        } else {
            TabView {
                HomeView(water_mL: $water_mL, viewState: $viewState)
                    .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                SettingsView(viewState: $viewState)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(remindersPerDay:Binding.constant( 1440.0), drinkSize: Binding.constant( 50.0))
    }
}
