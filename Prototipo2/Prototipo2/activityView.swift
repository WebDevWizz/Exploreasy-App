//
//  activityView.swift
//  PrototipoApp1
//
//  Created by Mario Cipolletta on 31/05/23.
//

import SwiftUI
import MapKit

struct activityView: View {
    
    @ObservedObject var myData = appData

    
    let screenSize = UIScreen.main.bounds.size
    @State var indice : Int
    
    var ColoreCuore : Color{
        if(myData.pinList[indice].fav){
            return Color.red
        }else{
            return Color.black
        }
    }
    
    var Cuore : String{
        if(myData.pinList[indice].fav){
            return "heart.fill"
        }else{
            return "heart"
        }
    }
    
    var body: some View {
            NavigationStack{
                    ZStack{
                        Color("BackGround")
                            .ignoresSafeArea()
                        VStack{
                                HStack{
                                    Image(myData.pinList[indice].image)
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(20)
                                        .listRowBackground(Color.clear)
                                        
                                        Spacer()
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("Date: " + myData.pinList[indice].data)
                                            .padding(.leading)
                                            .padding(.trailing)
                                            .padding(.top)
                                            
                                        Text("Cost: " + myData.pinList[indice].costo)
                                            .padding(.leading)
                                            .padding(.trailing)
                                        Text("Place: " + myData.pinList[indice].placeName)
                                            .padding(.leading)
                                            .padding(.trailing)
                                            .padding(.bottom)
                                    }.background(.white)
                                        .cornerRadius(10)
                                    
                                }
                            
                                .padding()
                            HStack{
                                Text("Description: \n" + myData.pinList[indice].descrizione)
                                    .padding()
                                }
                            .background(.white)
                            .cornerRadius(20)
                            .padding()
                            Spacer()
                                
                        }
                        .padding()
                        .navigationTitle(myData.pinList[indice].name)
                        .toolbar{
                            ToolbarItem(placement: .automatic){
                                Button(action:{
                                    if(myData.pinList[indice].fav ){
                                        myData.pinList[indice].fav = false
                                    }else{
                                        myData.pinList[indice].fav = true

                                    }
                                }){
                                    Image(systemName: Cuore)
                                        .foregroundColor(ColoreCuore)
                                        .font(.system(size:23))
                                        .padding(.top)
                        }
                    }
                }
                    }
        }
    }
}



struct activityView_Previews: PreviewProvider {
    static var previews: some View {
        activityView(indice: 1)
    }
}
