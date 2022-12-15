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
    @AppStorage("key1")  var shouldshowonb = true
    var body: some View {
        
          
        
        ZStack{
            if ans == nil || ans?.unsafe == false {
                LinearGradient(colors: [Color("BGColor1"),Color("BGColor2")], startPoint: .top, endPoint: .bottom)
            } else {
                LinearGradient(colors: [Color("HackedBG"),Color("HackedBG2")], startPoint: .top, endPoint: .bottom)
            }
            VStack{
                
                if  ans != nil   {
                    if ans?.unsafe == false && ans?.success == true{
                        
                        //if link is safe
                        VStack (alignment: .leading)  {
                            HStack{
                                Text("Safe Link").font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                                
                                
                                Image(systemName: "checkmark.shield.fill")
                                    .foregroundColor(Color("BGColor2"))
                                    .font(.largeTitle).fontWeight(.bold)
                                
                                
                            }
                            
                            
                            Text("you are safe")
                                .font(.title).fontWeight(.bold).foregroundColor(.white)
                            
                        } .padding(.leading, -110)
                        
                        
                        
                    } else if  ans?.unsafe == false && ans?.success == false {
                        //if link is not right
                        
                        
                        Text("URL is wrong make sure to copy right URL")  .fontWeight(.bold).foregroundColor(.white)
                    }
                    
                    else {
                        //if link is Unsafe
                        HStack {
                            
                            VStack{
                                HStack{
                                    Text("Haked Link")
                                        .font(.title).fontWeight(.bold).foregroundColor(.white)
                                    Image(systemName: "xmark.shield.fill")
                                        .foregroundColor(Color("HackedBG2"))
                                    .font(.largeTitle).fontWeight(.bold)}
                                Text("You Are Unsafe")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                            }.padding(.leading, -110)
                            
                            
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                ZStack{
                    clickbutton()
                    PasteButton(payloadType: String.self) { strings in
                        guard let first = strings.first else { return }
                        URL2 = first
                        
                        if URL2.contains("https://"){
                            URL2 = String(URL2.split(separator: "https://").first!)

                                                }
                        

                        Api().getSafety(url: URL2, completion: { Welcome in
                            ans =   Welcome
                            
                        })
                    }
                    
                }.tint(Color("ButtonColor"))
              
                if ans != nil {
                    
                    Button {
                        URL2 = ""
                        ans = nil
                    } label: {
                        if ans?.unsafe == false && ans?.success == true{
                            ButtonView(Word1: "New verfication")
                        }else if  ans?.unsafe == false && ans?.success == false {
                            ButtonView(Word1: "New verfication")
                        }
                        else
                        {
                            ButtonView(Word1: "New verfication", color: Color("buttoncolorh"))}
                    }
   
                  
                }
                
            }
        }.ignoresSafeArea()
            .fullScreenCover(isPresented: $shouldshowonb ){
            OnBoardingView(shouldshowonb: $shouldshowonb)
                 }.ignoresSafeArea(.all)
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
                completion(safety ?? Welcome(success: false, unsafe: false))
            }
            
        }.resume()
        
    }
    
}

//var url = "ipqualityscore.com"
//if url.contains("https://"){
//    url.split(separator: "https://").first}
//

