//
//  ContentView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//

import SwiftUI
import UserNotifications

enum ViewState{
    case home, authentication, signUp, login, forgotPassword
}

struct ContentView: View {
    
    @State var viewState: ViewState = ViewState.authentication
    @EnvironmentObject var userInfo: UserInfo
    @State var water_mL = 0
    var remindersPerDay = 1440
    var drinkSize = 50

    
    var body: some View {
//        if viewState == .authentication && !userInfo.loggedIn {
//            AuthenticationView(viewState: $viewState)
//        } else if viewState == .login && !userInfo.loggedIn {
//            LoginView(viewState: $viewState)
//        } else if viewState == .signUp && !userInfo.loggedIn {
//            SignUpView(viewState: $viewState)
//        } else if viewState == .forgotPassword && !userInfo.loggedIn {
//            ForgotPassword(viewState: $viewState)
//        } else {
//            HomeView(viewState: $viewState)
//        }
        
        
        VStack {
            Button {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Grant permission")
            }

            Button {
               
                let content = UNMutableNotificationContent()
                content.title = "Drink"
                content.subtitle = "\(drinkSize) mL"
                content.sound = UNNotificationSound.default
                var trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
               
                trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400.0/Double(remindersPerDay), repeats: true)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
                

            } label: {
                Text("Schedule Notification")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
