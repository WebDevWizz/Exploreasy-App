//
//  AddUsernameView.swift
//  Username
//
//  Created by Nadira Larducci on 01/06/23.
//

import SwiftUI
import UIKit

struct UtenteView: View {
    
    //MARK: PROPERTIES
    
    @ObservedObject var UserData = appData
    @State var email: String = ""
    @State var country: String = ""  //Lista dei paesi?
    @State var goals: String = ""    //Picker questionario
    @State var preferences: String = ""  //
    @State var experiences: String = ""  //
    @State var personalizedrecommendations: Bool = false
    @State var NewPhoto: Bool = false
    @State var ShowAddPage = false
    
    let type = ["Relax", "Work", "Adventure", "Culture"] //Aggiungi per quello che ci serve
    
    let exp = ["Cultur", "Sport", "Entertainment", "Forza Napoli"]
    
    let who = ["Alone", "couple", "Family", "Group"]
    
    //MAR: BODY
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        Image("ubaldo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                            .padding(.horizontal, 80)
                    }
                    .listRowBackground(Color.clear)
                    Section("Dati Utente") {
                        TextField (UserData.utente.email, text: $email)
                        TextField (UserData.utente.country, text: $country)
//                        Text ("Privacy")
                    }
                    
                    Section("Scopri") {
                        HStack {
                            List{
                                Picker("Holiday goals", selection: $goals){
                                    ForEach(type, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.menu)
                                }
                            }
                        HStack {
                            List{
                                Picker("Who are you traveling with?", selection: $preferences){
                                    ForEach(who, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.menu)
                                }
                            }
//                        HStack {
//                            List{
//                                Picker("Experiences", selection: $experiences){
//                                    ForEach(exp, id: \.self) {
//                                        Text($0)
//                                    }
//                                }
//                                .pickerStyle(.menu)
//                                }
//                            }
                    }
                    Section {
                        Toggle(isOn: $personalizedrecommendations) {
                            Text("Personalized Recommendations")
                        }
                        .navigationTitle ("Profile")
                    }
                }
            }
        }
    }
}
    //MARK PREVIEW
    
    struct AddProfile_Previews: PreviewProvider {
        static var previews: some View {
            UtenteView()
        }
    }

