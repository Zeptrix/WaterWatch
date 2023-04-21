//
//  WaterView.swift
//  WaterWatch
//
//  Created by Ori Orbach (student LM) on 3/7/23.
//

import SwiftUI

struct WaterView: View {
    
    @Binding var waterInfo: WaterInfo
    @AppStorage("Water", store: UserDefaults(suiteName: "group.coding.WaterWatch"))
    var waterData: Data = Data()
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ProgressBar(width: 200, height: 40, percent: waterInfo.waterPercent, color1: .black, color2: .blue)
                    Color.clear
                        .frame(width: 50, height: 50)
                    
                }
                
            }
        }
        
    }
    func save(waterInfo: WaterInfo){
        guard let waterData = try? JSONEncoder().encode(waterInfo) else { return }
        self.waterData = waterData
        print("save \(waterInfo.totalWater)")
    }
    
    struct WaterView_Previews: PreviewProvider {
        static var previews: some View {
            WaterView(waterInfo: Binding.constant(WaterInfo()))
        }
    }
}

