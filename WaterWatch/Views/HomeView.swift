//
//  HomeView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/7/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct HomeView: View {
    @Binding var water_mL: Int
    var waterRequirement_mL = 905
    var drinkSize_mL = 100
    @State var percent: CGFloat = 0
    
    @Binding var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        ZStack {
            if Double(water_mL) / Double(waterRequirement_mL) >= 2.0/3.0 {
                Image("wet")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            } else if Double(water_mL) / Double(waterRequirement_mL) >= 1.0/3.0 {
                Image("mid")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            } else {
                Image("dry")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack {
                ZStack {
                    ProgressBar(width: 300, height: 30, percent: percent, color1: .black, color2: .blue)
                        .animation(.spring())
                    Color.clear
                        .frame(width: 50, height: 50)
                        .animatingOverlay(for: percent)
                }
                
                Spacer()
                if waterRequirement_mL-water_mL > 0 {
                    VStack {
                        Button { withAnimation {
                            water_mL += drinkSize_mL
                            if water_mL > waterRequirement_mL {
                                water_mL = waterRequirement_mL
                            }
                            percent = CGFloat(Double(water_mL) / Double(waterRequirement_mL)) * 100
                        }
                        } label: {
                            Image("bottle")
                                .resizable()
                                .frame(width: 250, height: 250)
                                .shadow(radius: 10.0, x: 20, y: 10)
                                .padding(.bottom, 10)
                        }
                        Button { withAnimation {
                            water_mL += drinkSize_mL
                            if water_mL > waterRequirement_mL {
                                water_mL = waterRequirement_mL
                            }
                            percent = CGFloat(Double(water_mL) / Double(waterRequirement_mL)) * 100
                        }
                        } label: {
                            Text("Drink!")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.green)
                                .cornerRadius(15.0)
                                .shadow(radius: 10.0, x: 20, y: 10)
                        }
                    }
                } else {
                    VStack{
                        Image("emptybottle")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .shadow(radius: 10.0, x: 20, y: 10)
                            .padding(.bottom, 10)
                        Text("Full Quenched!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.gray)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }
                }
                Spacer()
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView(water_mL: Binding.constant(0), viewState: Binding.constant(.home))
        }
    }
}

struct AnimatableNumberModifier: AnimatableModifier {
    var number: Double
    
    var animatableData: Double {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text("\(Int(number))%")
                    .font(.headline)
                    .foregroundColor(.white)
            )
    }
}

extension View {
    func animatingOverlay(for number: Double) -> some View {
        modifier(AnimatableNumberModifier(number: number))
    }
}
