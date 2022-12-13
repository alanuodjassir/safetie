//
//  ClickPageView.swift
//  idk
//
//  Created by Alanoud Saleh on 14/05/1444 AH.
//

import SwiftUI

struct ClickPageView: View {
    @State var URL2 = ""
    @State   var ans : Welcome? = nil
    var body: some View {
        
        
        ZStack{
            if ans == nil || ans?.unsafe == false {
                LinearGradient(colors: [Color("BGColor1"),Color("BGColor2")], startPoint: .top, endPoint: .bottom)
            } else {
                LinearGradient(colors: [Color("HackedBG"),Color("HackedBG2")], startPoint: .top, endPoint: .bottom)
            }
            VStack{
                
                if  ans != nil   {
                    if ans?.unsafe == false{
                        HStack {
                            
                            
                            
                            
                            Text("Safe Link")
                            
                            Text(URL2)
                            Image(systemName: "checkmark.shield.fill")
                            Text("you are safe")
                        }
                    } else {
                        
                        HStack {
                            
                            
                            Text("Haked Link")
                            Text(URL2)
                            Image(systemName: "xmark.shield.fill")
                            Text("you are unsafe")
                        }
                    }
                }
                
                
                ZStack{
                    clickbutton()
                    PasteButton(payloadType: String.self) { strings in
                        guard let first = strings.first else { return }
                        URL2 = first
                        Api().getSafety(url: URL2, completion: { Welcome in
                            ans =   Welcome
                            
                        })
                    }
                    
                }.tint(Color("ButtonColor"))
                
            }
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
            Circle().fill(Color.white.opacity(0.10)).frame(width: 200,height: 200).scaleEffect(self.animetd ? 1:0)
            
            Circle().fill(Color.white.opacity(0.25)).frame(width: 300,height: 300).scaleEffect(self.animetd ? 1:0)
            Circle().fill(Color.white.opacity(0.35)).frame(width: 250,height: 300).scaleEffect(self.animetd ? 1:0)
            Circle().fill(Color.white.opacity(0.45)).frame(width: 350,height: 350).scaleEffect(self.animetd ? 1:0)
            
            
            Circle().fill(Color("ButtonColor")).frame(width: 150,height: 150)
            
            
        }
        .onAppear{
            
            self.animetd.toggle()
        }
        .animation(Animation.linear(duration: 1.5).repeatForever())
        
    }
}


struct Welcome : Decodable {
    
    let success, unsafe: Bool
}

class Api {
    func getSafety(url: String , completion : @escaping (Welcome)->()){
        
        guard let url = URL(string:"https://ipqualityscore.com/api/json/url/bELlKrN0Eq1aICFz5yHk37KlcNBvkI44/\(url)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _ , _ ) in
            let safety = try?JSONDecoder().decode(Welcome.self, from: data!)
            DispatchQueue.main.async {
                completion(safety ?? Welcome(success: false, unsafe: true))
            }
            
        }.resume()
        
    }
    
}
