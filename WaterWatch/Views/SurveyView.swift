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
    
    @EnvironmentObject var userInfo: UserInfo
    
    @Binding var viewState: ViewState
    @State var textFieldAge: String = ""

    
    //find sliders for weight and activity
    var body: some View {
        

        NavigationView{
            VStack{
                Spacer()

                
              
                Slider(
                    value: $userInfo.age,
                    in: 0...99, step: 1)
                .padding()
              
                Text("Age: \(userInfo.age, specifier: "%.0f")")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                
                
                //slider
                Slider(
                    value: $userInfo.weight,
                    in: 0...400, step: 1)
                .padding()
              
                Text("Weight in pounds: \(userInfo.weight, specifier: "%.0f")")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                
                
                Slider(
                    value: $userInfo.activity,
                    in: 0...360, step: 15)
                .padding()
                Text("\(userInfo.activity, specifier: "%.0f") avg daily minutes of actvity")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                
                
                Button(action:{

                    viewState = .settings
                }, label: {
                    Text("Save".uppercased())
                        .frame(maxWidth: . infinity)
                        .padding(30)
                        .background(Color.green.cornerRadius(10).padding())
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


