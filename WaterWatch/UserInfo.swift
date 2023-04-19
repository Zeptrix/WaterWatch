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

    var dictionary: [String: Double]{
        ["totalWater": totalWater,
         "amountDrank": amountDrank,
         "drinkSize": drinkSize,
         "age": age,
         "weight": weight,
         "activity": activity,
         "gender": gender,
         "remindersPerDay": remindersPerDay]
    }
    
    init(username: String = "", password: String = "", age: Double = 0.0, weight: Double = 0.0, activity: Double = 0.0, gender: Double = 0.0, totalWater: Double = 250.0, amountDrank: Double = 0.0, drinkSize: Double = 50.0, remindersPerDay: Double = 1440.0){
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
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let database = Database.database().reference()
        
        database.child("users/\(uid)").setValue(dictionary)
        
        database.child("users/\(uid)").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String: Double] else {return}
            if let t = value["totalWater"]{
                self.totalWater = t}
            if let am = value["amountDrank"]{
                self.amountDrank = am}
            if let ds = value["drinkSize"]{
                self.drinkSize = ds}
            if let ag = value["age"]{
                self.age = ag}
            if let w = value["weight"]{
                self.weight = w}
            if let ac = value["activity"]{
                self.activity = ac}
            if let g = value["gender"]{
                self.gender = g}
            if let rm = value["remindersPerDay"]{
                self.remindersPerDay = rm
            }
        })
    }
}
