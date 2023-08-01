//
//  AddPageView.swift
//  Host View
//
//  Created by Riccardo Ciullini on 04/06/23.
//

import SwiftUI
import MapKit

struct AddPageView: View {
    
    @ObservedObject var myData = appData
    
    
    @State var NActivity = Activity(coordinate: CLLocationCoordinate2D(latitude: 40.85225, longitude: 14.25045), name: "", category: ActivityCategory.sport, placeName: "", costo: "", data: "", star: 4, image: "", fav: false)
    
    @State var showImagePicker = false
    @State var nome = ""
    @State var luogo = ""
    @State var costo = ""
    @State var data = ""
    @State var description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    @State var colore = Color.accentColor //mi da la palette di colori
    @State var select = ""
    
    var Foto = ["SanGiovanni"]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Details"){
                    TextField("Name", text: $nome)
                    TextField("Date", text: $data)
                    TextField("Place", text: $luogo)
                    TextField("Cost", text: $costo)
                    TextField("Description", text: $description)
                }
                
                Section{
                    Picker("Add a photo", selection: $select){
                        ForEach(Foto, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section{
                    Button(action: {
                        NActivity.name = nome
                        NActivity.placeName = luogo
                        NActivity.costo = costo
                        NActivity.data = data
                        NActivity.descrizione = description
                        NActivity.image = select
                        print(select)
                        myData.newEvents.append(NActivity)
                        dismiss()
                    }, label: {
                        Text("Save")
                        
                    })
                }
            }.navigationTitle("New Event")
                //Metti qui il tasto 'add' per aggiungere poi ad una pagina predefinita di eventi (toolbar --> toolbarItem e implementi il codice)
                //MA NE DEVI PARLARE PRIMA CON MARIO!!
        }
    }
}


struct AddPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddPageView()
    }
}
