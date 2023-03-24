//
//  CheckBox.swift
//  WaterWatch
//
//  Created by Ori Orbach (student LM) on 3/13/23.
//
import SwiftUI
struct CheckBox: View {
    
    @State var isChecked1:Bool = false
    @State var isChecked2:Bool = false
    @State var isChecked3:Bool = false
    @State var StringImage : String = ""
    
    var title1:String
    var title2:String
    
    func toggle1(){
        isChecked1 = !isChecked1
        if StringImage.count < 10{
            StringImage += title1
        }
        else if isChecked1 == true && isChecked2 == false{
            StringImage = title1
        }
        else{
            StringImage = title2
        }
   }
    func toggle2(){
        isChecked2 = !isChecked2
        if StringImage.count < 10{
            StringImage += title2
        }
        else if isChecked1 == false && isChecked2 == true{
            StringImage = title2
        }
        else{
            StringImage = title1
        }
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
       
       if isChecked1 == true{
           Image(StringImage)
       }
       else if isChecked2 == true{
           Image(StringImage)
       }
      
     
   }
}
struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(title1: "", title2: "")
}
}


