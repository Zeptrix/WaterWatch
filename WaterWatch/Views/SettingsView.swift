//
//  SettingsView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/23/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SettingsView: View {
    
    @Binding var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(.settings))
    }
}
