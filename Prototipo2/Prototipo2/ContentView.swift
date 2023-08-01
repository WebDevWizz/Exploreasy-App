//
//  ContentView.swift
//  PrototipoApp1
//
//  Created by Mario Cipolletta on 30/05/23.
//

import SwiftUI
import MapKit


var activityNow = Activity(coordinate: CLLocationCoordinate2D(latitude: 40.83992, longitude: 14.25238), name: "Guided Tour", category: ActivityCategory.culture, placeName: "Castel Nuovo", costo: "Free", data: "01/07/2023", star: 2, image: "castelNuovo", fav: false)

struct ContentView: View {
    
    @ObservedObject var myData = appData
    @State var showScreen = false
    @State var hasVisitedApp = UserDefaults.standard.bool(forKey: "hasVisitedApp")
    let screenSize = UIScreen.main.bounds.size
    
    
    @State var indice = 0
    
    
    @State var colori = [Color.red, Color.blue, Color.green]

    
    var body: some View {
        NavigationStack{
//            Button("RESET"){
//                UserDefaults.standard.set(true, forKey: "hasVisitedApp") //trova modo alternativo per la presentazione
//            }
            VStack{
                TabView(selection: $indice){
                    ForEach((0..<myData.pinList.count), id: \.self) { indice in
                        CardView(indice: indice)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            }
            .navigationTitle("Discovery")
            .onAppear {
                if (hasVisitedApp) {
                    UserDefaults.standard.set(false, forKey: "hasVisitedApp")
                    hasVisitedApp = false
                    showScreen = true
                }
            }
            .sheet(isPresented: $showScreen){
                SurveyView()
            }
        }
        
    }
}

struct CardView: View{

    var indice: Int
    @State var present = false
    var activity = appData.pinList
    var screenSize = UIScreen.main.bounds.size
//    @State var Astar = activity.star
    
    var body: some View{
        NavigationStack{
            ZStack(alignment: .center){
                Image(activity[indice].image)
                    .resizable()
                    .imageScale(.small)
                VStack{
                    Text(activity[indice].name) //Vedi effetto domani
                        .font(.system(size:40))
                        .frame(width: screenSize.width * 0.7)
                    HStack{
                        ForEach((0..<activity[indice].star), id:\.self){_ in
                            Image(systemName: "star.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.yellow)
                        }
                        
                    }
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                


            }
            .onTapGesture {
                present = true
            }
            .frame(width: screenSize.width * 0.9, height: screenSize.height*0.7)
            .cornerRadius(20)
        }
        .sheet(isPresented: $present){
            activityView(indice: indice)
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

