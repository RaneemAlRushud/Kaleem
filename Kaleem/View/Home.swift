//
//  Home.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 11/08/1443 AH.
//

import Foundation
import SwiftUI
import UIKit
import CoreLocationUI



struct HomeAll: View{
   
    @State var showVideCall: Bool = false
    @ObservedObject private var UniObj  = SentencesVM()
    @ObservedObject private var FavObj  = SentencesVM()
    @StateObject var locationManager = LocationManager()
    @State var showhos: Bool = false
    @State var showuni: Bool = false
    @State var showcoffe: Bool = false
    @State var showNoResult: Bool = false
    @State var VM = VideoCallVM()
    @State var index = 0
    @ObservedObject private var PViewModel = ProfileVM()
   // @State var  Name : String = PViewModel.KaleemUser.name

    //@State var showuni: Bool = false
    
    var body: some View{
        
        
        NavigationView{
            
            
            
            
            VStack(spacing: 0){
                
//                HStack{
//
//
//                    Button(action: {}){
//                        // going to the full services
//                        Image(systemName: "square.grid.2x2")
//                            .font(.title)
//                            .foregroundColor(Color("Color"))
//
//
//                    }
//
//                    Spacer()
//
//
//                    Button(action: {}){
//                        // going to the full services
//                        Image(systemName: "person")
//                            .font(.title)
//                            .foregroundColor(Color("Color"))
//
//
//
//
//
//                    }
//                }
//
//                .padding(.horizontal)
//                .padding(.bottom, 5)
//                .padding()
//                // .background(Color("Gray").opacity(0.6))
//                //below line will have an effect iff colored
//                .clipShape(Corners(corner: [.bottomRight], size: CGSize(width:55, height: 55)))
                
                HStack{
                    
                    VStack{
                        
                        //image...
                        HStack{
                            
                            Spacer()
                        }
                        
                        HStack{
                            VStack(alignment: .trailing, spacing: 15){
                                
                                Text(" أهلاً بك .. " + PViewModel.KaleemUser.name)
                                    .font(Font.custom("Almarai-Bold", size: 35))
                                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                    .padding(.top,30)
                                
                                Text("حيثما لوّحت يداك وتُرجم صوتك")
                                    .fontWeight(.bold)
                                    .font(Font.custom("Almarai-Bold", size: 20))
                                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                
                                
                                
                                
                                
                            }
                            
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding(.leading,50)
                        .padding(.top,20)
                    }
                    // setting custom width...
                    .padding(.bottom, 70)
                   
                
                    .frame(width: UIScreen.main.bounds.width - 100)
                
                    .background(Color("Color"))
                    .clipShape(Corners(corner: [.topLeft, .topRight, .bottomRight], size: CGSize(width: 70, height: 55)))
                    
                } .padding(.trailing,80)
                
                HStack{

                   
                    
                    // Customization
                    
                    
                    Spacer()
                    
                    Text("الخدمات")
                        .font(Font.custom("Almarai-Bold", size: 30))
                    
                    
                }
                .foregroundColor(.black.opacity(0.6))
                .padding(.leading, 25)
                .padding(.top, 25)
                .padding(.trailing)

                
                
                ScrollView( .vertical, showsIndicators: false){

                    HStack(spacing: 10){
                        
                        //Call cards view methods
                        //Cards()
                        
                        //VC card
                        VStack(spacing: 10){
                            

                            
                            HStack{
                                
                                VStack(alignment: .trailing, spacing: 15){
                                    Text( "مكالمة")
                                        .kerning(1.6)
                                        
                                        .font(Font.custom("Almarai-Bold", size: 25))
//                                        .foregroundColor(.gray.opacity(1.5))
//                                        .padding(.leading, 60)
//                                        .padding(.bottom,-10)
//
                                    
                                    
//                                    Text("من خلال مكالمة مرئية")
//                                        .font(Font.custom("Almarai-Bold", size: 20))
//                                        .foregroundColor(.gray.opacity(0.9))
//                                      //  .foregroundColor(Color("DarkGray").opacity(0.5) )
//                                        .padding(.top, -7)
                                    
                                    
                                }//VStack#1
                                
                         
                                
                                
                            }  .padding()
                            
                            
                            
                         //   NavigationView{
                                HStack{
                                
                                Spacer()
                                //consider to change it sutibale icons
                                NavigationLink(destination: VideoCallV(), isActive: $showVideCall, label: {EmptyView()} )
                                        //.navigationBarTitle("", displayMode: .inline)
                                    //    .navigationBarHidden(true)
                                    
                                Button(action: {
                                    
                            
                                    self.showVideCall = true
                                 //   VM.updateVolunteerCallStatus()
                                }) {
                                    
                                    Image(systemName: "video.circle.fill")
                                        .foregroundColor(Color("Color"))
                                        .font(.system(size: 65))
                                        
                                }
                                
                            }
                            .padding(.trailing,130)
                            .padding(.bottom,50)
                            .padding(.top, -10)
                            //.padding(.top,10)
                            
                            
                            
                        }
                        
                        //setting custom width...
                        
                        .padding(.leading, 30)
                        .padding(.top, 60)
                        
                   // .frame(width: UIScreen.main.bounds.width / 2)
                        .frame(width: 180, height: 160 )
                        .background(self.index == 0 ?  Color("Color").opacity(0.2) : .gray.opacity(0.1))
                        .cornerRadius(35)
                        .onTapGesture {
                            self.index = 0
                        }
                        
                        //location card
                        VStack(spacing: 10){
                       
                            
                            
                            
                            ZStack {
                                HStack{
                                    
                                    VStack(alignment: .trailing, spacing: 15){
                                        Text("جمل مساعدة")
                                            .font(Font.custom("Almarai-Bold", size: 25))
                                           // .foregroundColor(.gray.opacity(1.5))
                                            .padding(.top, -30)
                                        
                                        
//                                        Text("بناءً على موقعك الحالي")
//                                            .font(Font.custom("Almarai-Bold", size: 20))
//                                            .foregroundColor(.gray.opacity(0.9))
//                                            .padding(.leading, -30)
//                                            .padding(.top, -15)
                                       
                                        
                                        
                                        
                                    }//VStack#2
                                    
                                    Spacer()
                                    
                                    
                                    
                                }
                                .padding(.leading, 25)
                               

                                HStack{
                                    
                                    NavigationLink(destination: LoadUniV(), isActive: $showhos, label: {EmptyView()} )
                                   
                                   NavigationLink(destination: LoadUniV(), isActive: $showuni, label: {EmptyView()} )
                                

                                   NavigationLink(destination: LoadUniV(), isActive: $showcoffe, label: {EmptyView()} )
                                    
                                   
                                   NavigationLink(destination: NoLocation(), isActive: $showNoResult, label: {EmptyView()} )
                                 


                                    
                                    
                             
                   
                                }
                                .padding(.trailing,130)
                                    //.padding(.bottom,30)
                                    .padding(.top,120) //HHEEERRREE
                                
                                
//                                HStack{
//
//                                    Spacer()
//                                    //consider to change it sutibale icons
//
//                                    NavigationLink(
//                                        destination:     UniV().navigationBarHidden(true),
//                                        label: {
//                                            Image(systemName: "location.fill")
//                                                .foregroundColor(Color("Color"))
//                                                .font(.system(size: 65))
//                                        }
//                                    )
//
//                                }
//
//                                .padding(.trailing,130)
//                                .padding(.bottom,50)
//                                .padding(.top, -10) ///DEMO
                                
                                
                            } .padding(.top, -80)
                            
                            
                       
                            
                        }
                        
                        //setting custom width...
                     
                        .padding(.leading, 50)
                        .padding(.top, 40)
                  //.frame(width: UIScreen.main.bounds.width / 2)

                        .frame(width: 180, height: 160 )
                        .background(self.index == 1 ? Color("Color").opacity(0.2)  : .gray.opacity(0.1))
                        .cornerRadius(35)
                        .onTapGesture {
                            self.index = 1
                        }
                        
                        
                        
   
                        
                    }
                   // .safeAreaInset(edge: <#T##VerticalEdge#>, content: <#T##() -> View#>)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.top, 25)
                    .padding(.bottom, 15)
               
                    LocationButton {
                      locationManager.requestLocation()

                    action: do {
                        if(locationManager.CalculateHospitalDistance() != 1.0 ){
                        self.showhos = true
                        }
                        else
                            if(locationManager.CalculateUniDistance() != 1.0 ){
                            self.showuni = true
                        }
                        else
                            if(locationManager.CalculateCoffeDistance() != 1.0 ){
                            self.showcoffe = true
                        }
                            else{
                                self.showNoResult = true}


                        locationManager.requestLocation()
                        print(String(locationManager.CalculateHospitalDistance()))

                        }
                    }
                   // .frame(  width: 900, height: 950)
                    .symbolVariant(.fill)
                    .foregroundColor(.white)
                    .cornerRadius(50.0)
                    .labelStyle(.iconOnly)
                    .tint(.blue)
                    .font(.largeTitle)
                    .padding(.trailing)
                    .tint(Color("Color"))
                    .onAppear() {
                      //  FavoriteListV()

                    }
    
                      

             
                    
                    //Favorite card
                    HStack(spacing: 10){
                        VStack(spacing: 10){
                            

                            
                            HStack{
                                
                                VStack(alignment: .trailing, spacing: 15){
                          Text("نص مسموع")
                                        .font(Font.custom("Almarai-Bold", size: 25))
                                          //   .foregroundColor(.gray.opacity(1.5))
//                                             .padding(.leading, -30)
//                                             .padding(.top, -25)
                                    
                                    
//
//                                 Text("ترجم كتابتك لنص مسموع")
//                                        .font(Font.custom("Almarai-Bold", size: 20))
//                                        .foregroundColor(.gray.opacity(0.9))
//                                        .padding(.top, -7)
                                    
                                    
                                }//VStack#1
                        
                                
                       //         Spacer()
                                
                                
                            }        .padding()
                            
                            
                            
                            HStack{
                                
                                Spacer()
                                //consider to change it sutibale icons
                                
                                NavigationLink(
                                    destination:     TextToSpeechV().navigationBarHidden(true),
                                    label: {
                                        Image(systemName: "speaker.wave.2.circle.fill")
                                            .foregroundColor(Color("Color"))
                                            .font(.system(size: 65))
                                    }
                                )
                                
                            }
                            
                            .padding(.trailing,130)
                            .padding(.bottom,50)
                            .padding(.top, -10)
                            //.padding(.top,10)
                            
                            
                        }
                        
                        //setting custom width...
                        
                        .padding(.leading, 30)
                        .padding(.top, 60)
                        
                   // .frame(width: UIScreen.main.bounds.width / 2)
                        .frame(width: 180, height: 160 )                        .background(self.index == 2 ?  Color("Color").opacity(0.2) : .gray.opacity(0.1))
                        .cornerRadius(35)
                        .onTapGesture {
                            self.index = 2
                    }
                        
                        
                        //Statistics card
                        VStack(spacing: 10){
                            

                            
                            HStack{
                                
                                VStack(alignment: .trailing, spacing: 15){
                              Text("من نحن")
                                        .font(Font.custom("Almarai-Bold", size: 25))
                                    //    .foregroundColor(.gray.opacity(1.5))
                                    
                                    
//
//                                 Text("استخدامك لكليــم")
//                                        .font(Font.custom("Almarai-Bold", size: 20))
//                                        .foregroundColor(.gray.opacity(0.9))
//                                        .padding(.top, -7)
                                    
                                    
                                }//VStack#1
                                
                                Spacer()
                                
                                
                            }
                            .padding(.leading,60)
                            
                            
                            HStack{
                                
                                Spacer()
                                //consider to change it sutibale icons
                                
                                NavigationLink(
                                    destination:    AboutV().navigationBarHidden(true),
                                    label: {
                                        Image(systemName: "person.2.circle.fill")
                                            .foregroundColor(Color("Color"))
                                            .font(.system(size: 65))
                                    }
                                )
                                
                            }
                            .padding(.trailing,130)
                            .padding(.bottom,28)
                            //.padding(.top,10)
                            
                            
                        }
                        
                        //setting custom width...
                        
                        .padding(.leading, 30)
                        .padding(.top, 60)
                        
                   // .frame(width: UIScreen.main.bounds.width / 2)
                        .frame(width: 180, height: 160 )                        .background(self.index == 3 ?  Color("Color").opacity(0.2) :.gray.opacity(0.1))
                        .cornerRadius(35)
                        .onTapGesture {
                            self.index = 3
                        }
                        
                    }
                   
                    
     
                    
                }
                .foregroundColor(.black.opacity(0.6))
       
           
                Spacer()
                
            }
     
            
            //moving view up
            //giving only space 10 b/w
            .onAppear(perform: { PViewModel.fetchUser()
                ;} )
         
            .padding(.top, 20)
            
            .navigationBarTitle("")
                            .navigationBarHidden(true)
            //        .edgesIgnoringSafeArea(.all)
            //        .statusBar(hidden: true)
            
            
            
            
        }
        
        
    }
    
}








struct Corners: Shape{
    
    var corner : UIRectCorner
    var size : CGSize
    func path(in rect: CGRect) -> Path{
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: size)
        
        return Path (path.cgPath)
    }
}



//struct Cards: View{
//    @State var index = 0
//    @StateObject var locationManager = LocationManager()
//    @State var showhos: Bool = false
//    var body: some View{
//
//        //VC card
//        VStack(spacing: 10){
//
//
//
//            HStack{
//
//                VStack(alignment: .trailing, spacing: 15){
//                    Text("الاستعانة بصديق")
//                        .font(Font.custom("Almarai-Bold", size: 20))
//                        .foregroundColor(Color("DarkGray"))
//
//
//
//                    Text("من خلال مكالمة مرئية")
//                        .font(Font.custom("Almarai-Bold", size: 20))
//                        .foregroundColor(Color("DarkGray").opacity(0.5) )
//                        .padding(.top, -7)
//
//
//                }//VStack#1
//
//                Spacer()
//
//
//            }
//
//
//
//            HStack{
//
//                Spacer()
//                //consider to change it sutibale icons
//
//                Button(action: {}) {
//
//                    Image(systemName: "video.circle.fill")
//                        .foregroundColor(Color("Color"))
//                        .font(.system(size: 75))
//
//                }
//
//            }
//            .padding(.trailing,130)
//            .padding(.bottom,25)
//            //.padding(.top,10)
//
//
//        }
//
//        //setting custom width...
//
//        .padding(.leading, 30)
//        .padding(.top, 60)
//
//   // .frame(width: UIScreen.main.bounds.width / 2)
//        .frame(width: 200, height: 200 )
//        .background(self.index == 0 ?  Color("Color").opacity(0.2) : Color("Gray").opacity(0.2))
//        .cornerRadius(35)
//        .onTapGesture {
//            self.index = 0
//        }
//
//        //location card
//        VStack(spacing: 10){
//
//
//
//
//            ZStack {
//                HStack{
//
//                    VStack(alignment: .trailing, spacing: 15){
//                        Text("جمل مساعدة")
//                            .font(Font.custom("Almarai-Bold", size: 20))
//                            .foregroundColor(Color("DarkGray"))
//                            .padding(.top, -30)
//
//
//                        Text("بناءً على موقعك الحالي")
//                            .font(Font.custom("Almarai-Bold", size: 20))
//                            .foregroundColor(Color("DarkGray").opacity(0.5))
//                            .padding(.leading, -30)
//                            .padding(.top, -15)
//
//
//
//
//                    }//VStack#2
//
//                    Spacer()
//
//
//
//                }
//                .padding(.leading, 25)
//
//
//                HStack{
//
//                    NavigationLink(destination:
//
//
//                               locationManager.CalculateHospitalDistance()<1000  && locationManager.CalculateHospitalDistance()>1.1 ?
//                              AnyView(SentencesVM())
//
//
//
//                              :    locationManager.CalculateHospitalDistance()<1000  && locationManager.CalculateHospitalDistance()>1.1 ?
//
//                              AnyView(SignUpInScreen())
//
//                              :       AnyView(SentencesVM())
//
//
//
//
//                              , isActive: $showhos, label: {                              LocationButton {
//
//                   locationManager.requestLocation()
//
//               action: do {
//
//                   self.showhos = true
//                   locationManager.requestLocation()
//                   print(String(locationManager.CalculateHospitalDistance()))
//
//
//
//               }
//
//
//               }
//                              .symbolVariant(.fill)
//                              .foregroundColor(.white)
//                              .cornerRadius(150)
//                              .labelStyle(.iconOnly)
//                              .font(.largeTitle)
//
//                   .tint(Color("Color"))} )
//                }
//                .padding(.trailing,130)
//                    .padding(.bottom,20)
//                    .padding(.top,160) //HHEEERRREE
//            } .padding(.top, -80)
//
//
//
//
//        }
//
//        //setting custom width...
//
//        .padding(.leading, 50)
//        .padding(.top, 40)
//  //.frame(width: UIScreen.main.bounds.width / 2)
//
//    .frame(width: 200, height: 200 )
//        .background(self.index == 1 ? Color("Color").opacity(0.2)  : Color("Gray").opacity(0.2))
//        .cornerRadius(35)
//        .onTapGesture {
//            self.index = 1
//        }
//
//
//
//        //Favorite card
//        VStack(spacing: 10){
//
//
//
//            HStack{
//
//                VStack(alignment: .trailing, spacing: 15){
//               Text("المفضـلة")
//                        .font(Font.custom("Almarai-Bold", size: 20))
//                        .foregroundColor(Color("DarkGray"))
//
//
//
//                 Text("وصول أسرع لمفضّلتك")
//                        .font(Font.custom("Almarai-Bold", size: 20))
//                        .foregroundColor(Color("DarkGray").opacity(0.5) )
//                        .padding(.top, -7)
//
//
//                }//VStack#1
//
//                Spacer()
//
//
//            }
//
//
//
//            HStack{
//
//                Spacer()
//                //consider to change it sutibale icons
//
//                Button(action: {}) {
//
//                    Image(systemName: "newspaper.circle.fill")
//                        .foregroundColor(Color("Color"))
//                        .font(.system(size: 75))
//
//                }
//
//            }
//            .padding(.trailing,130)
//            .padding(.bottom,25)
//            //.padding(.top,10)
//
//
//        }
//
//        //setting custom width...
//
//        .padding(.leading, 30)
//        .padding(.top, 60)
//
//   // .frame(width: UIScreen.main.bounds.width / 2)
//        .frame(width: 200, height: 200 )
//        .background(self.index == 2 ?  Color("Color").opacity(0.2) : Color("Gray").opacity(0.2))
//        .cornerRadius(35)
//        .onTapGesture {
//            self.index = 2
//        }
//
//    }
//
//}


struct HomeAll_Previews: PreviewProvider {
    // @State var selectedTab = "house"
    static var previews: some View {
        HomeAll()
        
    }
}



extension View{
    func getRect2()->CGRect{
        return UIScreen.main.bounds
    }
}
