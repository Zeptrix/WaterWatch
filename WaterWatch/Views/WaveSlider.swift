//
//  WaveSlider.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 4/20/23.
//

import SwiftUI

struct WaveSlider: View {
    
    var w = CGFloat(150)
    var h = CGFloat(350)
    
    @EnvironmentObject var userInfo: UserInfo
    @State var progress: CGFloat = 0.0
    @State var phase: CGFloat = 0.0
    
    @State var a = false
    @State var b = false
    @State var c = false
    @State var d = false
    
    var body: some View {
        ZStack {
            
            Capsule()
                .stroke(lineWidth: 10)
                .fill(Color.white)
                .frame(width: w + 10, height: h + 10)
            
            Water_Wave(progress: self.progress, phase: self.phase)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom))
                .frame(width: w, height: h, alignment: .center)
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        self.progress = 1 - (value.location.y / self.h)
                        if self.progress < 0 {self.progress = 0}
                        if self.progress > 1 {self.progress = 1.0}
                        userInfo.drinkSize = self.progress * userInfo.totalWater / 3
                }))
            
                .clipShape(Capsule())
                .onAppear(){
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                        self.phase = .pi * 2
                    }
                }
            
            Circle()
                .frame(width: a ? 0: w / 10, height: a ? 0: w / 10)
                .offset(x: w / 4, y: h / 2.8)
                .foregroundColor(.white)
                .animation(Animation.easeInOut(duration: 0.7).delay(1.5).repeatForever(autoreverses: true))
                .onAppear {
                    a.toggle()
                }
            
            Circle()
                .frame(width: b ? 0: w / 11, height: b ? 0: w / 11)
                .offset(x: -w / 4, y: h / 4)
                .foregroundColor(.white)
                .animation(Animation.easeInOut(duration: 0.5).delay(1.8).repeatForever(autoreverses: true))
                .onAppear {
                    b.toggle()
                }
            
            Circle()
                .frame(width: c ? w / 10: 0, height: c ? 0: w / 10)
                .offset(x: -w / 5.5, y: c ? -h / 5.5: h / 3.5)
                .foregroundColor(.white)
                .animation(Animation.easeInOut(duration: 2.5).delay(1).repeatForever(autoreverses: false))
                .onAppear {
                    c.toggle()
                }
            
            Circle()
                .frame(width: d ? w / 10: 0, height: d ? 0: w / 10)
                .offset(x: w / 5.5, y: d ? -h / 5.5: h / 4)
                .foregroundColor(.white)
                .animation(Animation.easeInOut(duration: 2).delay(1).repeatForever(autoreverses: false))
                .onAppear {
                    d.toggle()
                }
            
            Text("\(Int(userInfo.totalWater * progress / 3)) mL").bold().foregroundColor(.white)
        }.onAppear {
            progress = userInfo.drinkSize / userInfo.totalWater * 3
        }
    }
}

struct Water_Wave: Shape {
    let progress: CGFloat
    var amplitude: CGFloat = 10
    var waveLength: CGFloat = 20
    var phase: CGFloat
    
    var animatableData: CGFloat {
        get{phase}
        set{phase = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let midWidth = width / 2
        let progressHeight = height * (1 - progress)
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        for x in stride(from: 0, through: width + 15, by: 5) {
            let relativeX = x / waveLength
            let normalizedLength = (x - midWidth) / midWidth
            let y = progressHeight + sin(phase + relativeX) * amplitude + normalizedLength
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        return path
    }
}

struct WaveSlider_Previews: PreviewProvider {
    static var previews: some View {
        WaveSlider()
    }
}
