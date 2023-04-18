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
    @Published var loggedIn: Bool = true
    
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
        
        let database = Database.database().reference()
        
        database.child("users/\(uid)").setValue(dictionary)
        
        
        database.child("users/\(uid)").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String: Double] else{return}
            if let t = value["totalWater"]{
                self.totalWater = t}
            if let ag = value["age"]{
                self.age = ag}
            if let w = value["weight"]{
                self.weight = w}
            if let ac = value["activity"]{
                self.activity = ac}
        })
      //fire base storage goes here
//        Database.database().reference().child("users/\(uid)").observeSingleEvent(of: .value)
//            { snapshot in
//                let dictionary = snapshot.value as? [String: AnyObject] ?? [:]
//
//
//                Storage.storage().reference(forURL: ag as! String).getData(maxSize: <#Int64#>){
//                    data, error in
//                    if let data = data{
//                        self.age = Double(data) ?? self.age
//                    } else {
//                        print(error?.localizedDescription)
//                    }
//                }
//        }
        
    }
    
}


