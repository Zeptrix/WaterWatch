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

class UserInfo: ObservableObject, Identifiable, Codable {
    
    enum CodingKeys: CodingKey{
        case id, username, password, loggedIn, totalWater, amountDrank, drinkSize, age, weight, activity, gender, remindersPerDay, percent
    }
    
    @Published var id: String
    @Published var percent: Double
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
    
    init(username: String = "", password: String = "", age: Double = 0.0, weight: Double = 0.0, activity: Double = 0.0, gender: Double = 0.0, totalWater: Double = 300.0, amountDrank: Double = 0.0, drinkSize: Double = 10.0, remindersPerDay: Double = 1440.0, id: String = "", percent: Double = 0.0){
        self.id = id
        self.username = username
        self.password = password
        
        self.percent = percent
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(loggedIn, forKey: .loggedIn)
        try container.encode(totalWater, forKey: .totalWater)
        try container.encode(amountDrank, forKey: .amountDrank)
        try container.encode(drinkSize, forKey: .drinkSize)
        try container.encode(age, forKey: .age)
        try container.encode(weight, forKey: .weight)
        try container.encode(activity, forKey: .activity)
        try container.encode(gender, forKey: .gender)
        try container.encode(remindersPerDay, forKey: .remindersPerDay)
        try container.encode(percent, forKey: .percent)
    }
    
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        username = try container.decode(String.self, forKey: .username)
        password = try container.decode(String.self, forKey: .password)
        loggedIn = try container.decode(Bool.self, forKey: .loggedIn)
        totalWater = try container.decode(Double.self, forKey: .totalWater)
        amountDrank = try container.decode(Double.self, forKey: .amountDrank)
        drinkSize = try container.decode(Double.self, forKey: .drinkSize)
        age = try container.decode(Double.self, forKey: .age)
        weight = try container.decode(Double.self, forKey: .weight)
        activity = try container.decode(Double.self, forKey: .activity)
        gender = try container.decode(Double.self, forKey: .gender)
        remindersPerDay = try container.decode(Double.self, forKey: .remindersPerDay)
        percent = try container.decode(Double.self, forKey: .percent)
        
    }
    
}


