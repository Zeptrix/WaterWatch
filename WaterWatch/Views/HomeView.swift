//
//  HomeView.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/7/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct HomeView: View {
    
    @Binding var viewState: ViewState
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        VStack {
            Button(action: {
                try! Auth.auth().signOut()
                userInfo.loggedIn = false
                viewState = .authentication
            }) {
                Text("Log Out")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewState: Binding.constant(.home))
    }
}
