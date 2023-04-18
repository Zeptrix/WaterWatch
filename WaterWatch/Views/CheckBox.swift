//
//  CheckBox.swift
//  WaterWatch
//
//  Created by Ori Orbach (student LM) on 3/13/23.
//
import SwiftUI
struct CheckBox: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @State var isChecked1:Bool = false
    @State var isChecked2:Bool = false
    @State var isChecked3:Bool = false
    
    // male
    func toggle1(){
        isChecked1 = !isChecked1
        userInfo.gender = 0
    }
    
    // female
    func toggle2(){
        isChecked2 = !isChecked2
        userInfo.gender = 1
        
    }
    
    // other
    func toggle3(){
        isChecked3 = !isChecked3
        userInfo.gender = 2
    }
    var body: some View {
        
        Button(action: toggle1){
            HStack{
                Text("Male")
                Image(systemName: isChecked1 ? "checkmark.square": "square")
                
            }
        }
        
        Button(action: toggle2){
            HStack{
                Text("Female")
                Image(systemName: isChecked2 ? "checkmark.square": "square")
            }
        }
        
        Button(action: toggle3){
            HStack{
                Text("Other")
                Image(systemName: isChecked3 ? "checkmark.square": "square")
            }
        }
        
        
        
    }
}
struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox()
    }
}
