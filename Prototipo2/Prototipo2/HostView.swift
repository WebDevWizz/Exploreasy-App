//
//  Prova.swift
//  Host View
//
//  Created by Riccardo Ciullini on 04/06/23.
//

import SwiftUI
import UIKit


struct HostView: View {
    @State private var isOverlayPresented = false //Solita variabile per controllare la pressione del tasto
    @State private var Share = false
    
    var body: some View {

        NavigationStack{
            VStack {
//                    Text("Add your event")
//                        .font(.largeTitle).bold()
//    //                    .frame(alignment: .topLeading)
//                        .padding(.top, 10)
                    Spacer()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray)
                            .opacity(0.39)
                            .padding()
                        
                        Button(action: {
                            isOverlayPresented = true
                        }) {
                            Text("+")
                                .font(.system(size: 70))
                                .foregroundColor(Color.black)
                                .padding()
                        }
                        
                        
                        
                        
                    } //End ZStack
                    
                    //Button di share
//                    Button(action: {
//                        Share = true
//                    }) {
//                        Text("Share")
//                            .font(.headline)
//                            .foregroundColor(Color.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }

                    
                } //End VStack
            .navigationTitle("Add your event")
                .padding() //Rimpicciolisco un po' il tutto
                .sheet(isPresented: $isOverlayPresented){
                    AddPageView()
                }
                .scrollDisabled(false)
            
            
            
//                .overlay(
//                    Group {
//                        if isOverlayPresented {
//                            OverlayView(isOverlayPresented: $isOverlayPresented)
//                        }
//                    }
//                )//end overlay
        }

        

    }//End View
    
}




//-----------------------------------------------------------------

//Apertura in overlay ----> MA FORSE MI CONVIENE FARLA IN MODALE????
//struct OverlayView: View {
//    @Binding var isOverlayPresented: Bool
//    @State var ShowAddPage = false
//
//
//
//    var body: some View {
//        NavigationStack{
//            ZStack {
//                Color.black.opacity(0.6)
//                    .edgesIgnoringSafeArea(.all) //si indica alla vista di estendersi oltre tutti i bordi dell'area sicura, coprendo completamente l'intero schermo
//                //                VStack{
//                //                    Form{
//                //                        Section("Evento"){
//                //                            TextField("Nome", text: $nome)
//                //                            TextField("Luogo", text: $luogo)
//                //    //                        TextField("Data", text: <#T##Binding<String>#>)
//                //                            TextField("Costo", text: $costo)
//                //                            TextField("Descrizione", text: $description)
//                //                        }
//                //                    }//End form
//                //                }
//
//                VStack {
//                    Text("Overlay")
//                        .font(.title)
//                        .foregroundColor(.white)
//
//                    Button(action: {
//                        isOverlayPresented.toggle()
//                    }) {
//                        Text("Chiudi")
//                            .font(.headline)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//
//                    .padding()
//                    .background(Color.gray)
//                    .cornerRadius(10)
//                    .padding(40)
//                }
//            }
//
//        }
//    }
//



    struct HostView_Preview: PreviewProvider {
        static var previews: some View {
            HostView()
        }
    }



