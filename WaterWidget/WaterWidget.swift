//
//  WaterWatch_Widget.swift
//  WaterWatch.Widget
//
//  Created by Ori Orbach (student LM) on 4/19/23.
//

import WidgetKit
import SwiftUI

struct WaterEntry: TimelineEntry {
    var date : Date
    var waterInfo: WaterInfo
}

struct WaterProvider: TimelineProvider {
    
    @AppStorage("Water", store: UserDefaults(suiteName: "group.coding.WaterWatch"))
    var waterData: Data = Data()
    
    func placeholder(in context: Context) -> WaterEntry {
        return WaterEntry(date: Date(), waterInfo: WaterInfo(amountDrank: 0, totalWater: 0, waterPercent: 0, id: ""))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WaterEntry) -> Void) {
        guard let waterInfo = try? JSONDecoder().decode(WaterInfo.self, from: waterData) else { return }
        let entry = WaterEntry(date: Date(), waterInfo: waterInfo)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WaterEntry>) -> Void){
        guard let waterInfo = try? JSONDecoder().decode(WaterInfo.self, from: waterData) else {return}
        let entry = WaterEntry(date: Date(), waterInfo: waterInfo)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
    
}

struct WaterWidgetView: View {
    let entry: WaterProvider.Entry
    @ViewBuilder
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                ZStack{
                    ProgressBar(width: 350, height: 80, percent: entry.waterInfo.waterPercent, color1: .black, color2: .blue)
                    Color.clear
                        .frame(width: 50, height: 50)
                    Text("\((entry.waterInfo.amountDrank)/1000.0, specifier: "%.2f") L").foregroundColor(.white)
       
                }
                Spacer()
            }.padding()
        }.background(LinearGradient(gradient: Gradient(colors: [.blue]), startPoint: .top, endPoint: .bottom))
    }
    
}
@main
struct WaterWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "WaterWatchWidget",
            provider: WaterProvider()
        ) { entry in
            WaterWidgetView(entry: entry)
        }
        .configurationDisplayName("WaterWidget")
        .description("Shows the user amount of water that they drank")
        .supportedFamilies([.systemSmall])
    }
}

