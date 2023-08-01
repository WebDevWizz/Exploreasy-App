//
//  Prototipo2App.swift
//  Prototipo2
//
//  Created by Mario Cipolletta on 06/06/23.
//

import SwiftUI

// globalTab comanda che screen fare uscire: 1 -> scelta Host/User; 2 -> User; 3 -> Host

@main
struct Prototipo2App: App {
    
    @ObservedObject var myData = appData
    
    var body: some Scene {
        WindowGroup {
            if (myData.globalTab == 1){
                ChoseView()
            }else if(myData.globalTab == 2){
                TabView{
                    ContentView()
                        .tabItem{
                            Text("Discovery")
                            Image(systemName: "globe.europe.africa.fill")
                        }
                    MapsView()
                        .tabItem{
                            Text("Maps")
                            Image(systemName: "map.fill")
                        }
                    FavouritePlaces()
                        .tabItem{
                            Text("Favourite")
                            Image(systemName: "heart.fill")
                        }
                    UtenteView()
                        .tabItem{
                            Text("User")
                            Image(systemName: "person.circle.fill")
                        }
                    
                }
            }else{
                TabView{
                    HostView()
                        .tabItem{
                            Text("Add event")
                            Image(systemName: "plus.rectangle.portrait.fill")
                        }
                    MyEventView()
                        .tabItem{
                            Text("My Event")
                            Image(systemName: "list.bullet.clipboard")
                        }
                }
            }
        }
    }
}
