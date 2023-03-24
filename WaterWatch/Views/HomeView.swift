//
//  HomeView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/7/23.
//
/*
import SwiftUI
import Firebase
import FirebaseAuth

struct HomeView: View {
    
    @Binding var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
    var waterRequirement_mL-water_mL: Double = 0.0
    
    var body: some View {
        ZStack{
            if Double(waterRequirement_mL-water_mL) <= 100{
                Image("wet")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            } else if Double(waterRequirement_mL-water_mL) <= 200{
                Image("dirt")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            } else if Double(waterRequirement_mL-water_mL) <= 300{
                Image("dry")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            }
        
        VStack {
            Spacer()
                  if waterRequirement_mL-water_mL > 0{
                      Text("\(waterRequirement_mL-water_mL) mL remaining today")
                          .padding()
                  } else if waterRequirement_mL-water_mL <= 0{
                      Text("All necessary water has been consumed!")
                          .padding()
                  }
                  
                  Spacer()
                  Button{
                      water_mL += drinkSize_mL
                  } label: {
                      if waterRequirement_mL-water_mL > 0{
                          ZStack{
                              Rectangle()
                                  .foregroundColor(Color.green)
                                  .cornerRadius(10)
                                  .padding()
                              Text("Drink")
                                  .foregroundColor(Color.white)
                          }
                      } else {
                          ZStack{
                              Rectangle()
                                  .foregroundColor(Color.gray)
                                  .cornerRadius(10)
                                  .padding()
                              Text("Drink")
                                  .foregroundColor(Color.white)
                          }
                          
                      }
                  }
                  Spacer()
        }}

            Button(action: {
                try! Auth.auth().signOut()
                userInfo.loggedIn = false
                viewState = .authentication
            }) {
                Text("Log Out")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewState: Binding.constant(.home))
    }
}
*/
