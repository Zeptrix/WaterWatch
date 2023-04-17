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
    @State var remindersPerDay: Double = 1440.0
    @State var drinkSize = 50.0
    @State var every_minutes = 1.0
    
    var body: some View {
        
        VStack{
            Spacer()
            Slider(
                value: $drinkSize,
                in: 0...500, step: 10).padding()
            Text("Drink size: \(drinkSize, specifier: "%.0f") mL")
                .padding()
                .font(.headline)
                .foregroundColor(.white)
            
            Slider(
                value: $remindersPerDay,
                in: 0...1440, step: 1).padding()
            Text("1 reminder every \((1440/remindersPerDay), specifier: "%.0f") minutes")
                .padding()
                .font(.headline)
                .foregroundColor(.white)
            
            //notifications
            Button {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
                let content = UNMutableNotificationContent()
                content.title = "Drink"
                content.subtitle = "\(drinkSize) mL"
                content.sound = UNNotificationSound.default
                var trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                
                trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400.0/Double(remindersPerDay), repeats: true)
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
            }.padding()
            
            Button{
                viewState = .survey
            } label: {
                Text("Change info")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding()
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
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding()
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.blue, .yellow]), startPoint: .top, endPoint: .bottom)
                )
        .edgesIgnoringSafeArea(.all)
        
       
    }



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(.settings))
    }
}

}
