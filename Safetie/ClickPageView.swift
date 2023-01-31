//
//  ClickPageView.swift
//  idk
//
//  Created by Alanoud Saleh on 14/05/1444 AH.


//test link
// www.google.com
// funnygames.veramorozova.com



import SwiftUI

struct ClickPageView: View {
    @State var URL2 = ""
    @State   var ans : result? = nil
    @AppStorage("key7")  var shouldshowonb = true
    @State var animation = false
    let generator = UINotificationFeedbackGenerator()
 //   @State var color = "ButtonColor"
    
    var body: some View {
        
          
        
        ZStack{
            
        // firt view ,wrong url
            if ans == nil || ans?.unsafe == false && ans?.success == false {
               // LinearGradient(colors: [.white], startPoint: .top, endPoint: .bottom)
            }
            
       
         else if ans?.unsafe == false {

                // safe view color
                LinearGradient(colors: [Color("BGColor1"),Color("BGColor2")], startPoint: .top, endPoint: .bottom)
            } else {
                //haked view color
                LinearGradient(colors: [Color("HackedBG"),Color("HackedBG2")], startPoint: .top, endPoint: .bottom).onAppear{
                    self.generator.notificationOccurred(.warning)
                }
            }
            VStack(spacing: 35){
               
                if !URL2.isEmpty && ans == nil {
                    ProgressView() //.padding(.bottom,25)
                  
                } else if  ans?.unsafe == false && ans?.success == false {
                    
                }
                
                //if link is safe
                if  ans != nil   {
                    if ans?.unsafe == false && ans?.success == true{
                        
                        
        VStack (alignment: .leading)  {
        
            
    HStack{
    Text("Safe Link").font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                                
                                
                                Image(systemName: "checkmark.shield.fill")
                                    .foregroundColor(Color("BGColor2"))
                                    .font(.largeTitle).fontWeight(.bold)
                                
                                
                            }
                            
                            
                            Text("You're all set.")
                                .font(.title).fontWeight(.bold).foregroundColor(.white)
                            
                        } .padding(.leading, -110)
                        
                        
                        //if link is not right
                    } else if  ans?.unsafe == false && ans?.success == false {
                       
                        
                        
                        Text("URL is wrong make sure to copy right URL")  .fontWeight(.bold).foregroundColor(.white)
                    }
                    
                    else {
                        //if link is Unsafe
                        HStack {
                            
                            VStack(alignment:.leading){
                                HStack{
                                    Text("Unsafe Link")
                                        .font(.title).fontWeight(.bold).foregroundColor(.white)
                                    Image(systemName: "xmark.shield.fill")
                                        .foregroundColor(Color("HackedBG2"))
                                    .font(.largeTitle).fontWeight(.bold)}
                                Text("Be careful.")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                            }.padding(.leading, -110)
                            
                            
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                VStack {
                    if URL2 == "" {
                        
        
                        Text("Please Copy And Paste Link Here")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("ButtonColor"))
                            .multilineTextAlignment(.center)
                        
                    }
                    ZStack{
                        if ans?.unsafe == true {
                            clickbutton( animation: $animation, colorName: "buttoncolorh")
                            
                        }else{
                            clickbutton(animation: $animation)
                            
                        }
                        
                        
                        //past button
                        PasteButton(payloadType: String.self) { strings in
                            guard let first = strings.first else { return }
                            URL2 = first
                            
                            if !animation  {
                                animation.toggle()
                            }
                            if URL2.contains("https://"){
                                URL2 = String(URL2.split(separator: "https://").first!)

                                                    }
                            if URL2.contains("/"){
                                let arr = URL2.split(separator: "/")
                                URL2 = arr.reduce("", +)
                                
                            }
                          

                            Api().getSafety(url: URL2, completion: { Welcome in
                                ans =   Welcome
                                
                            })
                        }//past button
                        
                        
                    }.tint(Color(ans?.unsafe == true ? "buttoncolorh" : "ButtonColor"))
                }
              
                if ans != nil {
                    
                    Button {
                        URL2 = ""
                        ans = nil
                        animation.toggle()
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
                    .padding(.top)
                  
                }
                
            }.animation(Animation.spring())
        }.ignoresSafeArea()
            .fullScreenCover(isPresented: $shouldshowonb ){
            OnBoardingView(shouldshowonb: $shouldshowonb)
                 }.ignoresSafeArea(.all)
            
    }
}

struct ClickPageView_Previews: PreviewProvider {
    static var previews: some View {
        ClickPageView()
       // clickbutton(animation: .constant(false))
    }
}




struct clickbutton: View {
    @Binding var animation :Bool
@State var colorName = "ButtonColor"
    var body: some View {
        
        ZStack{
            
          //  Spacer().frame(width: 350, height: 350)
            
         //   if animation {
                Circle()
                    .foregroundColor(Color(colorName))
                    .frame(width: 250,height: 250)
                    .opacity(0.6)
                    .scaleEffect(self.animation ? 1:0)
                
                
                
                
                
                
                
                
                Circle()
                    .foregroundColor(Color(colorName))
                    .frame(width: 250,height: 215)
                    .opacity(0.2).scaleEffect(self.animation ? 1:0)
                
                
                
                
                
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 170,height: 190)
                    .opacity(0.5).scaleEffect(self.animation ? 1:0).scaleEffect(self.animation ? 1:0)
                
                
                
                
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 140,height: 190)
                    .scaleEffect(self.animation ? 1:0)
            }
            
            
            
            
            /// main circle
            Circle().fill(Color(colorName))
            
                .frame(width: 100,height: 100)
            
            
     //   }
            
//        }.onAppear{
//
//        self.animation.toggle()
//        }

        .animation(Animation.easeInOut)
     
    }
}


struct result : Decodable {
    
    let success, unsafe: Bool
}

class Api {
    func getSafety(url: String , completion : @escaping (result)->()){
    
        guard let url = URL(string:"https://ipqualityscore.com/api/json/url/bELlKrN0Eq1aICFz5yHk37KlcNBvkI44/\(url)") else {
            completion( result(success: false, unsafe: false))

            return }
   
        URLSession.shared.dataTask(with: url) { (data, _ , _ ) in
            let safety = try?JSONDecoder().decode(result.self, from: data!)
            DispatchQueue.main.async {
                completion(safety ?? result(success: false, unsafe: false))
            }
            
        }.resume()
        
    }
    
}

//var url = "ipqualityscore.com"
//if url.contains("https://"){
//    url.split(separator: "https://").first}
//

