//
//  CheckBox.swift
//  WaterWatch
//
//  Created by Ori Orbach (student LM) on 3/13/23.
//
import SwiftUI
struct CheckBox: View {
    
    @StateObject var userInfo: UserInfo = UserInfo()
    @State var isChecked1:Bool = false
    @State var isChecked2:Bool = false
    @State var isChecked3:Bool = false
    
    var title1:String
    var title2:String
    var title3:String
    
    func toggle1(){
        isChecked1 = !isChecked1
        userInfo.gender = title1
   }
    func toggle2(){
        isChecked2 = !isChecked2
        userInfo.gender = title2
      
   }
    func toggle3(){
        isChecked3 = !isChecked3
        userInfo.gender = title3
   }
   var body: some View {
       
       Button(action: toggle1){
           HStack{
               Text(title1)
               Image(systemName: isChecked1 ? "checkmark.square": "square")
      
           }
       }
     
       Button(action: toggle2){
           HStack{
               Text(title2)
               Image(systemName: isChecked2 ? "checkmark.square": "square")
           }
       }
      
       Button(action: toggle3){
           HStack{
               Text(title3)
               Image(systemName: isChecked3 ? "checkmark.square": "square")
           }
       }
       
      
     
   }
}
struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(title1: "", title2: "", title3: "")
        
}
}




