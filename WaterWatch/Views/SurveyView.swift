//
//  SurveryView.swift
//  WaterWatch
//
//  Created by Ori Orbach (student LM) on 3/8/23.
//
import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
struct SurveryView: View {
    
    @StateObject var userInfo: UserInfo = UserInfo()
    
    
    @State var textFieldAge: String = ""
    @State var weight: Double = 0.0
    @State var activity: Double = 0.0
    
    //find sliders for weight and activity
    
    var body: some View {
        
        NavigationView{
            VStack{
                TextField("Enter your age", text: $textFieldAge)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.red)
                    .font(.headline)
                
              
                Spacer()
                //slider
                Slider(
                    value: $userInfo.weight,
                    in: 0...400, step: 1)
                Text("\(userInfo.weight, specifier: "%.0001f") weight in pounds")
                
                
                Slider(
                    value: $userInfo.activity,
                    in: 0...360, step: 15)
                Text("\(userInfo.activity, specifier: "%.0001f") avg daily minutes of actvity")
                
                Button {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    ZStack{
                        Rectangle()
                            .padding()
                            .cornerRadius(60)
                            .foregroundColor(Color.green)
                        Text("Enable Notifications")
                            .padding()
                            .foregroundColor(Color.white)
                    }
                   
                }
                Button(action:{
                    userInfo.age = Double(textFieldAge) ?? 0.0
                }, label: {
                    Text("Save".uppercased())
                        .frame(maxWidth: . infinity)
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    
                })
            }
        }
        
    }
 
    
}
struct SurveryView_Previews: PreviewProvider {
    static var previews: some View {
        SurveryView()
    }
}


