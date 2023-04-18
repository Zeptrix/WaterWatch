//
//  WaterIntake.swift
//  WaterWatch
//
//  Created by Ori Orbach (student LM) on 3/23/23.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase


class waterIntake: ObservableObject {
    @StateObject var userInfo: UserInfo = UserInfo()
    
    var tempature: Double = 0.0
    
    func waterIntake(){
        if(tempature > 80 ){
            if(userInfo.gender == 1) { //.5
                userInfo.totalWater = ((userInfo.weight * (1.0/2.0)) + ((userInfo.activity * (1.0/30.0)) * 12.0) + (tempature/5.0))
            }
            else if(userInfo.gender == 0){
                userInfo.totalWater = ((userInfo.weight * (2.0/3.0)) + ((userInfo.activity * (1.0/30.0)) * 12.0) + (tempature/5.0))
            }
            else {
                userInfo.totalWater = ((userInfo.weight * (1.0/2.0)) + ((userInfo.activity * (1.0/30.0)) * 12.0) + (tempature/5.0))
            }
        }
        else{
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
}
