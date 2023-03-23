//
//  Constants.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/7/23.
//

import Foundation
import SwiftUI

struct Constants {
    static let buttonFont : Font = Font(UIFont(name: "HelveticalNeue-Thun", size: 16) ?? UIFont.systemFont(ofSize:16))
    
    static let textFont : Font = Font(UIFont(name: "HelveticalNeue-Thun", size: 20) ?? UIFont.systemFont(ofSize:20))
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
    static let sandyOrange = Color("SandyOrange")
    static let wateryBlue = Color("WateryBlue")
}
