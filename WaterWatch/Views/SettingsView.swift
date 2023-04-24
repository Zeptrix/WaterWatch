//
//  SettingsView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/23/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import UserNotifications


struct SettingsView: View {
    
    @Binding var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.gray, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                .scaleEffect(1.5)
            VStack {
                Spacer()
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .shadow(radius: 10.0, x: 20, y: 10)
                WaveSlider()
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                    .shadow(radius: 10.0, x: 20, y: 10)
                Button {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        //                    if let error = error {
                        //                        print(error.localizedDescription)
                        //                    }
                    }
                    let content = UNMutableNotificationContent()
                    content.title = "Drink"
                    content.subtitle = String(format: "%.0f", userInfo.drinkSize) + " mL"
                    content.sound = UNNotificationSound.default
                    var trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)


                    trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400.0/Double(userInfo.remindersPerDay), repeats: true)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)

                } label: {
                    Text("Enable Notifications")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }
                Button{
                    try! Auth.auth().signOut()
                    userInfo.loggedIn = false
                    viewState = .authentication
                } label: {
                    Text("Log Out")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.cyan)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding()
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView(viewState: Binding.constant(.settings))
        }
    }
    
}
