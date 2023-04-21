//
//  WaterInfo.swift
//  WaterWatch
//
//  Created by Ori Orbach (student LM) on 4/20/23.
//

import Foundation


class WaterInfo: Identifiable, Codable{
    var amountDrank: Double
    var totalWater: Double
    var waterPercent: Double
    var drinkSize: Double
    
    var id: String
    
    init(amountDrank: Double = 0.0, totalWater: Double = 300.0, waterPercent: Double = 0.0, drinkSize: Double = 10.0, id: String = "") {
    self.amountDrank = amountDrank
    self.totalWater = totalWater
    self.waterPercent = waterPercent
    self.drinkSize = drinkSize
    self.id = id

        
    }

}
