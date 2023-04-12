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
    
    @Binding var viewState: ViewState
    @State var textFieldAge: String = ""
    @State var weight: Double = 0.0
    @State var activity: Double = 0.0
    
    //find sliders for weight and activity
    
    var body: some View {
        
        NavigationView{
            VStack{
                Spacer()
                TextField("Enter your age", text: $textFieldAge)
                    .padding(50)
                    .background(Color.white.opacity(0.5).cornerRadius(10).padding())
                    .foregroundColor(.gray)
                    .font(.headline)
                
              
             
                //slider
                Slider(
                    value: $userInfo.weight,
                    in: 0...400, step: 1)
                .padding()
                Text("\(userInfo.weight, specifier: "%.0f") weight in pounds")
                
                
                Slider(
                    value: $userInfo.activity,
                    in: 0...360, step: 15)
                .padding()
                Text("\(userInfo.activity, specifier: "%.0f") avg daily minutes of actvity")
                
                
                Button(action:{
                    userInfo.age = Double(textFieldAge) ?? 0.0
                    viewState = .settings
                }, label: {
                    Text("Save".uppercased())
                        .frame(maxWidth: . infinity)
                        .padding(50)
                        .background(Color.blue.cornerRadius(10).padding())
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    
                })
                Spacer()
            }.background(
                LinearGradient(gradient: Gradient(colors: [.blue, .yellow]), startPoint: .top, endPoint: .bottom)
                    )
            .edgesIgnoringSafeArea(.all)
        }
        
    }
 
    
}
struct SurveryView_Previews: PreviewProvider {
    static var previews: some View {
        SurveryView(viewState: Binding.constant(.survey))
    }
}


