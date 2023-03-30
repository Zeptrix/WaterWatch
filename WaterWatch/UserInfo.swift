//
//  UserInfo.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//
import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class UserInfo: ObservableObject {
    @Published var username: String
    @Published var password: String
    @Published var loggedIn: Bool = false
    
    @Published var totalWater: Double
    @Published var age: Double
    @Published var weight: Double
    @Published var activity: Double
    @Published var gender: String

    var dictionary: [String: Double]{
        ["totalWater": totalWater,
         "age": age,
         "weight": weight,
         "activity": activity]
    }
    
    init(username: String = "", password: String = "", age: Double = 0.0, weight: Double = 0.0, activity: Double = 0.0, gender: String = "", totalWater: Double = 0.0){
        self.username = username
        self.password = password
        
        self.age = age
        self.weight = weight
        self.activity = activity
        self.gender = gender
        self.totalWater = totalWater
        
        Auth.auth().addStateDidChangeListener { _, user in
            guard let user = user else {return}
            
            self.username = user.email ?? ""
            self.loggedIn = true
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
      
        
    }
    
}


