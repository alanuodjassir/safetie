//
//  ContentView.swift
//  idk
//
//  Created by Alanoud Saleh on 13/05/1444 AH.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        
        ZStack{
            
            
            LinearGradient(colors: [Color("BGColor1"),Color("BGColor2")], startPoint: .top, endPoint: .bottom)
            VStack(spacing:75){
               
                
                VStack{
                    TextLineView()
                    RectView()
                    RectView(SFName: "exclamationmark.triangle", Title: "Report haked links", Content: "See how many people vistied the link.")
                    RectView(SFName: "person.2", Title: "See Vistors", Content: "See how many people vistied the link.")
                    
                }
                
                VStack(alignment:.leading){
                    TextLineView(Word1: "One", Word2: "Click")
                    TextLineView(Word1: "and you’re all", Word2: "Safe")
                }
                
                Button {
                    
                } label: {
                    Text("Start").foregroundColor(.white).background{
                       
                       
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 200, height: 45).foregroundColor(Color("ButtonColor")).shadow(radius: 0.3)
                    }
                }

            }
        }.ignoresSafeArea()
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     

        OnBoardingView()
    }
}


struct RectView: View {
    @State var SFName = "checkmark.diamond"
    @State var Title = "URL Checker"
    @State var Content = "check any link before you open it to make sure it is safe link."
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 26).foregroundColor(Color("RectColor")).frame(width: 360, height: 73).opacity(0.5)
            RoundedRectangle(cornerRadius: 26).foregroundColor(Color("RectColor")).frame(width: 335, height: 73)
            
            HStack{
                
                Image(systemName: SFName).foregroundColor(.white).font(.title)
                
                VStack(alignment: .leading){
                    Text(Title).foregroundColor(.white).bold()
                    Text(Content).foregroundColor(.white.opacity(0.7))
                }
            }.padding(.horizontal,40)
        }
    }
}

struct TextLineView: View {
    @State var Word1 = "With"
    @State var Word2 = "Safetie"
    var body: some View {
        HStack{
            Text(Word1)
            Text(Word2).foregroundColor(Color("ButtonColor")).bold()
        }.font(.title)
    }
}
