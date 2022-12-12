//
//  ClickPageView.swift
//  idk
//
//  Created by Alanoud Saleh on 14/05/1444 AH.
//

import SwiftUI

struct ClickPageView: View {
    var body: some View {
        
        
        
        
        
        
        
        
        
        
        ZStack{
            
            
            LinearGradient(colors: [Color("BGColor1"),Color("BGColor2")], startPoint: .top, endPoint: .bottom)
            
            
            clickbutton()
            
            
            
        }.ignoresSafeArea()
        
      
        
        
    }
}

struct ClickPageView_Previews: PreviewProvider {
    static var previews: some View {
        ClickPageView()
    }
}




struct clickbutton: View {
    @State var animetd = false
    
    var body: some View {
     
        ZStack{
            Circle().fill(Color.white.opacity(0.10)).frame(width: 150,height: 150).scaleEffect(self.animetd ? 1:0)
           
            Circle().fill(Color.white.opacity(0.25)).frame(width: 200,height: 200).scaleEffect(self.animetd ? 1:0)
            Circle().fill(Color.white.opacity(0.35)).frame(width: 250,height: 250).scaleEffect(self.animetd ? 1:0)
            Circle().fill(Color.white.opacity(0.45)).frame(width: 350,height: 300).scaleEffect(self.animetd ? 1:0)
            
            Circle().fill(Color("ButtonColor")).frame(width: 100,height: 100)
            
            
        }
        .onAppear{
            
            self.animetd.toggle()
        }
        .animation(Animation.linear(duration: 1.5).repeatForever())
        
           }
}
