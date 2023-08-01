//
//  AppData.swift
//  PrototipoApp1
//
//  Created by Mario Cipolletta on 31/05/23.
//

import Foundation
import SwiftUI
import MapKit


struct Activity: Identifiable {
    
    
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    var name: String
    var category: ActivityCategory
    var placeName: String
    var costo: String
    var data: String
    var descrizione: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    let star: Int
    var image: String
    var fav: Bool
    
    static func ==(lhA: Activity, rhA: Activity) -> Bool {
        return lhA.id == rhA.id
    }
    
    
}



enum ActivityCategory {
    case sport
    case food
    case culture
    case all
}


struct Utente: Identifiable{
    
    var id = UUID()
    var email: String
    var country: String
    var goals: String
    var preferences: String
    var experiences: String
    var personalizedrecommendations: Bool = false
    
}

//CLLocationCoordinate2D(latitude: 40.85291, longitude: 14.27259)
//CLLocationCoordinate2D(latitude: 40.83992, longitude: 14.25238)

//var pin1 = Activity(coordinate: CLLocationCoordinate2D(latitude: 40.85291, longitude: 14.27259), name: "Stazione Centrale", category: ActivityCategory.food)



class AppData: ObservableObject{
    
    @Published var globalTab = 1
    
    @Published var pinList = [
        
        //CULTURE
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.85291, longitude: 14.27259), name: "Special Dinner", category: ActivityCategory.food, placeName: "SomeRestaurant", costo: "30/40$", data: "10/06/2023", star: 3, image: "ristorante1", fav: false),
        
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.87425, longitude: 14.25511), name: "Bosco di Capodimonte", category: ActivityCategory.sport, placeName: "Corsa", costo: "Free", data: "2/09/2023", star: 4, image: "capodimonte", fav: false),
        
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.83593, longitude: 14.24856), name: "Scudetto celebration", category: ActivityCategory.sport, placeName: "Piazza del Plebiscito", costo: "Free", data: "04/06/2023", star: 5, image: "piazzaPlebiscito", fav: false),
        
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.83992, longitude: 14.25238), name: "Guided Tour", category: ActivityCategory.culture, placeName: "Castel Nuovo", costo: "Free", data: "01/07/2023", star: 2, image: "castelNuovo", fav: false),
                        
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.84919, longitude: 14.25488), name: "Cappella Sansevero", category: ActivityCategory.culture, placeName: "Museo Cappella Sansevero", costo: "Free", data: "02/07/2023", star: 5, image: "cappellaSansevero", fav: false),
                
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.85108, longitude: 14.25685), name: "Napoli Sotteranea", category: ActivityCategory.culture, placeName: "Napoli Sotteranea", costo: "12$", data: "08/07/2023", star: 4, image: "napoliSotteranea", fav: false),
                
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.82140, longitude: 14.42620), name: "Vesuvius National Park", category: ActivityCategory.culture, placeName: "Vesuvio Tour", costo: "85$", data: "10/08/2023", star: 4, image: "vesuvio", fav: false),
                
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.82774, longitude: 14.24803), name: "Castel dell'Ovo", category: ActivityCategory.culture, placeName: "casteldell'Ovo", costo: "Free", data: "05/08/2023", star: 5, image: "casteldellovo", fav: false),
                
                //FOOD
                
//        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.85936, longitude: 14.26223), name: "Dinner at 'A Figlia d''o Marenaro", category: ActivityCategory.food, placeName: "Cena", costo: "50$", data: "20/07/2023", star: 4, image: "lafigliadelmarinaio", fav: false),
                
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.82842, longitude: 14.22000), name: "The best pizza in Naples", category: ActivityCategory.food, placeName: "Pizza", costo: "20$", data: "28/07/2023", star: 5, image: "pizzeria50kalo", fav: false),
                
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.84125, longitude: 14.28957), name: "Dinner on the ship", category: ActivityCategory.food, placeName: "Cena in mare", costo: "100$", data: "5/08/2023", star: 5, image: "velierotortuga", fav: false),

       
        
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.84315, longitude: 14.22230), name: "Best burger in Naples", category: ActivityCategory.food, placeName: "panino", costo: "10$", data: "16/06/2023", star: 3, image: "puok", fav: false),
                
                //SPORT
                
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.82798, longitude: 14.19289), name: "Diego Armando Maradona' stadium", category: ActivityCategory.sport, placeName: "Stadio Maradona", costo: "Free", data: "01/08/2023", star: 5, image: "stadiomaradona", fav: false),
                
        
                
        Activity(coordinate: CLLocationCoordinate2D(latitude: 40.85225, longitude: 14.25045), name: "Guided bike tour", category: ActivityCategory.sport, placeName: "Giro in bici", costo: "30$", data: "15/09/2023", star: 4, image: "giroinbicinapoli", fav: false)

        


    ]
    
    @Published var newEvents: [Activity] = [Activity(coordinate: CLLocationCoordinate2D(latitude: 40.85225, longitude: 14.25045), name: "Guided bike tour", category: ActivityCategory.sport, placeName: "Giro in bici", costo: "30$", data: "15/09/2023", star: 4, image: "giroinbicinapoli", fav: false)]
    
    
    
    
    
    
    
    
    
    @Published var utente = Utente(email: "Example@icloud.com", country: "Italy", goals: "Relax", preferences: "Family", experiences: "Food")
    
    
}

var appData = AppData()





