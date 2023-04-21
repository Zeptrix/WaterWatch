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

struct NewAccountView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @StateObject var data = FetchData()
    @Binding var viewState: ViewState
    @State var offset1: CGFloat = 0
    @State var offset2: CGFloat = 0
    @State var offset3: CGFloat = 0
    @State var offset4: CGFloat = 0
    
    //find sliders for weight and activity
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color.gray, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                    .scaleEffect(1.5)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Health Statistics")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .padding(.top, 25)
                        .padding(.bottom, 20)
                    
                    // weight
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color.watery)
                                .frame(width: 35, height: 35)
                                .padding(5)
                            
                            Text("Weight")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text(getWeight())
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Capsule()
                                .fill(Color.black.opacity(0.25))
                                .frame(height: 30)
                            
                            Capsule()
                                .fill(Color.watery)
                                .frame(width: offset1 + 20, height: 30)
                            
                            HStack(spacing: (UIScreen.main.bounds.width - 100) / 12) {
                                ForEach(0..<12,id: \.self) { index in
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                                }
                            }
                            .padding(.leading)
                            
                            Circle()
                                .fill(Color.sandy)
                                .frame(width: 35, height: 35)
                                .background(Circle().stroke(Color.white, lineWidth: 5))
                                .offset(x: offset1)
                                .gesture(DragGesture().onChanged({ (value) in
                                    if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                        offset1 = value.location.x - 20
                                    }
                                }))
                        }
                    }.padding([.leading, .trailing]).padding(.bottom, 5)
                        .onAppear {
                            offset1 = userInfo.weight / 400 * 320
                        }
                    
                    // age
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color.indigo)
                                .frame(width: 35, height: 35)
                                .padding(5)
                            
                            Text("Age")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text(getAge())
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Capsule()
                                .fill(Color.black.opacity(0.25))
                                .frame(height: 30)
                            
                            Capsule()
                                .fill(Color.indigo)
                                .frame(width: offset2 + 20, height: 30)
                            
                            HStack(spacing: (UIScreen.main.bounds.width - 100) / 12) {
                                ForEach(0..<12,id: \.self) { index in
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                                }
                            }
                            .padding(.leading)
                            
                            Circle()
                                .fill(Color.sandy)
                                .frame(width: 35, height: 35)
                                .background(Circle().stroke(Color.white, lineWidth: 5))
                                .offset(x: offset2)
                                .gesture(DragGesture().onChanged({ (value) in
                                    if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                        offset2 = value.location.x - 20
                                    }
                                }))
                        }
                    }.padding([.leading, .trailing]).padding(.bottom, 5)
                        .onAppear {
                            offset2 = userInfo.age / 100 * 320
                        }
                    
                    // activity
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color.mint)
                                .frame(width: 35, height: 35)
                                .padding(5)
                            
                            Text("Activity")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text(getActivity())
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Capsule()
                                .fill(Color.black.opacity(0.25))
                                .frame(height: 30)
                            
                            Capsule()
                                .fill(Color.mint)
                                .frame(width: offset3 + 20, height: 30)
                            
                            HStack(spacing: (UIScreen.main.bounds.width - 100) / 12) {
                                ForEach(0..<12,id: \.self) { index in
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                                }
                            }
                            .padding(.leading)
                            
                            Circle()
                                .fill(Color.sandy)
                                .frame(width: 35, height: 35)
                                .background(Circle().stroke(Color.white, lineWidth: 5))
                                .offset(x: offset3)
                                .gesture(DragGesture().onChanged({ (value) in
                                    if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                        offset3 = value.location.x - 20
                                    }
                                }))
                        }
                    }.padding([.leading, .trailing]).padding(.bottom, 5)
                        .onAppear {
                            offset3 = userInfo.activity / 360 * 320
                        }
                    
                    // gender
                    VStack {
                        HStack {
                            Circle()
                                .fill(getColor())
                                .frame(width: 35, height: 35)
                                .padding(5)
                            
                            Text("Gender")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text(getGender())
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Capsule()
                                .fill(Color.black.opacity(0.25))
                                .frame(height: 30)
                            
                            Capsule()
                                .fill(getColor())
                                .frame(width: offset4 + 20, height: 30)
                            
                            HStack(spacing: (UIScreen.main.bounds.width - 100) / 12) {
                                ForEach(0..<12,id: \.self) { index in
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                                }
                            }
                            .padding(.leading)
                            
                            Circle()
                                .fill(Color.sandy)
                                .frame(width: 35, height: 35)
                                .background(Circle().stroke(Color.white, lineWidth: 5))
                                .offset(x: offset4)
                                .gesture(DragGesture().onChanged({ (value) in
                                    if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                        offset4 = value.location.x - 20
                                    }
                                }))
                        }
                    }.padding([.leading, .trailing]).padding(.bottom, 25)
                        .onAppear {
                            offset4 = userInfo.gender * (1.0/3.0) * 320 + (320.0 / 6.0)
                        }
                    Button(action:{
                        userInfo.weight = (offset1 / (UIScreen.main.bounds.width - 70)) * 400
                        userInfo.age = (offset2 / (UIScreen.main.bounds.width - 70)) * 100
                        userInfo.activity = (offset3 / (UIScreen.main.bounds.width - 70)) * 360
                        if(offset4 / (UIScreen.main.bounds.width - 70) < 0.33) {
                            userInfo.gender = 0
                        }
                        else if (offset4 / (UIScreen.main.bounds.width - 70) < 0.66) {
                            userInfo.gender = 1
                        }
                        else {
                            userInfo.gender = 2
                        }
                        updateWater()
                        viewState = .home
                    }, label: {
                        Text("Create Account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }).padding(.bottom, 150)
                }
            }
        }.edgesIgnoringSafeArea(.top)
        
    }
    
    func updateWater() {
        if(data.response.current.temp_f > 80 ) {
            if(userInfo.gender == 1) { //.5
                userInfo.totalWater = ((userInfo.weight * (1.0/2.0)) + ((userInfo.activity * (1.0/30.0)) * 12.0) + (data.response.current.temp_f/5.0))
            }
            else if(userInfo.gender == 0) {
                userInfo.totalWater = ((userInfo.weight * (2.0/3.0)) + ((userInfo.activity * (1.0/30.0)) * 12.0) + (data.response.current.temp_f/5.0))
            }
            else {
                userInfo.totalWater = ((userInfo.weight * (1.0/2.0)) + ((userInfo.activity * (1.0/30.0)) * 12.0) + (data.response.current.temp_f/5.0))
            }
        }
        else {
            if(userInfo.gender == 1) { //.5
                userInfo.totalWater = ((userInfo.weight * (1.0/2.0)) + ((userInfo.activity * (1.0/30.0)) * 12.0) )
            }
            else if(userInfo.gender == 0){
                userInfo.totalWater = ((userInfo.weight * (2.0/3.0)) + ((userInfo.activity * (1.0/30.0)) * 12.0))
            }
            else {
                userInfo.totalWater = ((userInfo.weight * (1.0/2.0)) + ((userInfo.activity * (1.0/30.0)) * 12.0))
            }
        }
    }
    
    func getWeight() -> String {
        let percent = offset1 / (UIScreen.main.bounds.width - 70)
        return String(format: "%.0f", percent * 400) + " LBS"
    }
    func getAge() -> String {
        let percent = offset2 / (UIScreen.main.bounds.width - 70)
        return String(format: "%.0f", percent * 100) + " Years"
    }
    
    func getActivity() -> String {
        let percent = offset3 / (UIScreen.main.bounds.width - 70)
        return String(format: "%.0f", percent * 360) + " Minutes"
    }
    
    func getGender() -> String {
        let percent = offset4 / (UIScreen.main.bounds.width - 70)
        if(percent < 0.33) {
            return "Male"
        }
        else if (percent < 0.66) {
            return "Female"
        }
        else {
            return "Other"
        }
    }
    
    func getColor() -> Color {
        let percent = offset4 / (UIScreen.main.bounds.width - 70)
        if(percent < 0.33) {
            return Color.blue
        }
        else if (percent < 0.66) {
            return Color.pink
        }
        else {
            return Color.purple
        }
    }
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView(viewState: Binding.constant(.newaccount))
    }
}
