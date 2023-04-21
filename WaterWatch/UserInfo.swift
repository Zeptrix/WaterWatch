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
    @Published var amountDrank: Double
    @Published var drinkSize: Double
    @Published var age: Double
    @Published var weight: Double
    @Published var activity: Double
    @Published var gender: Double
    @Published var remindersPerDay: Double

    var dictionary: [String: Double] {
        ["totalWater": totalWater,
         "amountDrank": amountDrank,
         "drinkSize": drinkSize,
         "age": age,
         "weight": weight,
         "activity": activity,
         "gender": gender,
         "remindersPerDay": remindersPerDay]
    }
    
    init(username: String = "", password: String = "", age: Double = 0.0, weight: Double = 0.0, activity: Double = 0.0, gender: Double = 0.0, totalWater: Double = 250.0, amountDrank: Double = 0.0, drinkSize: Double = 50.0, remindersPerDay: Double = 144.0){
        self.username = username
        self.password = password
        
        self.age = age
        self.weight = weight
        self.activity = activity
        self.gender = gender
        self.totalWater = totalWater
        self.amountDrank = amountDrank
        self.drinkSize = drinkSize
        self.remindersPerDay = remindersPerDay
                
        Auth.auth().addStateDidChangeListener { _, user in
            guard let user = user else {return}
            
            self.username = user.email ?? ""
            self.loggedIn = true
        }
        
        readData()
    }
    
    func readData() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let rootRef = Database.database().reference()

        rootRef.child("users/\(uid)").observe(.value, with : {(snapshot) in
            if snapshot != nil {
                if snapshot.hasChild("activity") {
                    let activity = snapshot.childSnapshot(forPath: "activity").value as! Double
                    self.activity = activity
                    print(activity)
                }
                if snapshot.hasChild("age") {
                    let age = snapshot.childSnapshot(forPath: "age").value as! Double
                    self.age = age
                    print(age)
                }
                if snapshot.hasChild("amountDrank") {
                    let amountDrank = snapshot.childSnapshot(forPath: "amountDrank").value as! Double
                    self.amountDrank = amountDrank
                    print(amountDrank)
                }
                if snapshot.hasChild("drinkSize") {
                    let drinkSize = snapshot.childSnapshot(forPath: "drinkSize").value as! Double
                    self.drinkSize = drinkSize
                    print(drinkSize)
                }
                if snapshot.hasChild("gender") {
                    let gender = snapshot.childSnapshot(forPath: "gender").value as! Double
                    self.gender = gender
                    print(gender)
                }
                if snapshot.hasChild("remindersPerDay") {
                    let remindersPerDay = snapshot.childSnapshot(forPath: "remindersPerDay").value as! Double
                    self.remindersPerDay = remindersPerDay
                    print(remindersPerDay)
                }
                if snapshot.hasChild("totalWater") {
                    let totalWater = snapshot.childSnapshot(forPath: "totalWater").value as! Double
                    self.totalWater = totalWater
                    print(totalWater)
                }
                if snapshot.hasChild("weight") {
                    let weight = snapshot.childSnapshot(forPath: "weight").value as! Double
                    self.weight = weight
                    print(weight)
                }
            }
        })
    }
}
