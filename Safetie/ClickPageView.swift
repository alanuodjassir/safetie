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
            
            
            
            
            
            clicklCircle()
            clicklCircle()
            
            
            
            
            
        }.ignoresSafeArea()
        
    }
}

struct ClickPageView_Previews: PreviewProvider {
    static var previews: some View {
        ClickPageView()
    }
}

struct clicklCircle: View {
   
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("ButtonColor"))
                .frame(width: 100, height: 100)
            
            
            
            
            
        }
    }
}
