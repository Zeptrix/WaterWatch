//
//  LoginView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var viewState: ViewState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewState: Binding.constant(.login))
    }
}
