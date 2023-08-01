//
//  activityView.swift
//  PrototipoApp1
//
//  Created by Mario Cipolletta on 31/05/23.
//

import SwiftUI
import MapKit

struct activity2View: View {
    
    @ObservedObject var myData = appData

    
    let screenSize = UIScreen.main.bounds.size
    @State var indice : Int
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
            NavigationStack{
                    ZStack{
                        Color("BackGround")
                            .ignoresSafeArea()
                        VStack{
                                HStack{
                                    Image(myData.newEvents[indice].image)
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(20)
                                        .listRowBackground(Color.clear)
                                        
                                        Spacer()
                                    VStack(alignment: .leading, spacing: 5){
                                        Text("Date: " + myData.newEvents[indice].data)
                                            .padding(.leading)
                                            .padding(.trailing)
                                            .padding(.top)
                                            
                                        Text("Cost: " + myData.newEvents[indice].costo)
                                            .padding(.leading)
                                            .padding(.trailing)
                                        Text("Place: " + myData.newEvents[indice].placeName)
                                            .padding(.leading)
                                            .padding(.trailing)
                                            .padding(.bottom)
                                    }.background(.white)
                                        .cornerRadius(10)
                                    
                                }
                            
                                .padding()
                            HStack{
                                Text("Description: \n" + myData.newEvents[indice].descrizione)
                                    .padding()
                                }
                            .background(.white)
                            .cornerRadius(20)
                            .padding()
                            Spacer()
                        }
                        .padding()
                        .navigationTitle(myData.newEvents[indice].name)
                    }
        }
    }
}



struct activity2View_Previews: PreviewProvider {
    static var previews: some View {
        activity2View(indice: 0)
    }
}
