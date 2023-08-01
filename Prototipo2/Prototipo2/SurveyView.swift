//
//  ContentView.swift
//  Prova
//
//  Created by Riccardo Ciullini on 31/05/23.
//

import SwiftUI
import UIKit //per immagini

struct SurveyView: View {
    @State var Page: Int = 1 //Token di incremento (e decremento) pagina
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Welcome User!").font(.title).bold()
                Text("Let's personalize your experience")
                    .padding()
                    .font(.system(size: 20))
                
                NavigationLink(destination: SecondView(Page: Page)) {
                    Text("Next")//Caratteristiche bottone "Next"
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }.padding()
            }//end VSTACK
            
        }
    }//end View
}


//---------------------------------
//Seconda pagina

struct SecondView: View {
    //@State private var selectedAnswer: Int? = nil //Per indicare che nessuna risposta è stata selezionata
    @State private var selectedAnswer: Set <Int> = []
    @State var Page: Int = 1 //Token per incremento pagoina
    let customColor = Color(red: 223/255, green: 194/255, blue: 194/255)

    
    let answers = ["Cultur", "Sport", "Entertainment", "Relax"]
    
    //-----------------------------

    
    var body: some View {
        NavigationStack{
                HStack{
                    
                    ZStack{
                        Circle()
                            .fill(customColor)
                            .opacity(0.9)
                            .frame(width: 50, height: 35)
                            .padding(.top,10)
                        Text("1")
                            .foregroundColor(.black)
                            .offset(y: 5)
                    }//end first Zstack
                    
                    ZStack{
                        Circle()
                            .fill(customColor)
                            .opacity(0.9)
                            .frame(width: 50, height: 35)
                            .padding(.top,10)
                        Text("2")
                            .foregroundColor(.black)
                            .offset(y: 5)
                            .opacity(0.1)
                    }//end second ZStack
                    
                    ZStack{
                        Circle()
                            .fill(customColor)
                            .opacity(0.9)
                            .frame(width: 50, height: 35)
                            .padding(.top,10)
                        Text("3")
                            .foregroundColor(.black)
                            .offset(y: 5)
                            .opacity(0.1)
                    }//end third ZStack
                } //END CODICE PALLINI
             
            
            VStack() {
                Text("What type of activity are you interested in doing?")
                    .font(.title).bold()
                    .padding(.top, 40)
                
            
                
                //List per inserire le choices
                List(0..<answers.count, id: \.self) { index in
                    Button(action: {//for multiple choices
                        if selectedAnswer.contains(index){
                            selectedAnswer.remove(index)
                        }
                        else{
                            selectedAnswer.insert(index)
                        }
                    }) {
                        HStack {
                            //Una sorta di 'if?', : = OR
                            Image(systemName: selectedAnswer.contains(index) ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(selectedAnswer.contains(index) ? .blue : .gray)
                            
                                
                                .font(.title)
                                .padding()
                            
                            Text(answers[index])
                                .font(.headline)
                        }//End HStack
                        
                    }//End Button
                    .buttonStyle(PlainButtonStyle())
//                    .listRowBackground(Color.clear)
                }
                
                .padding()
                    .cornerRadius(63)
                //Lista finita
                
                Spacer()
                
                //Next Page:
                NavigationLink(destination: ThirdView(Page: $Page)){
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }.padding()
            }//end VStack
        }
            
    }//end Nav
        
}



//--------------------------------
//Terza Pagina

struct ThirdView: View{
    @Binding var Page: Int
    @State private var selectedAnswer: Set <Int> = []
    let customColor = Color(red: 223/255, green: 194/255, blue: 194/255)
    let answers = ["Alone", "Couple", "Family", "Group"]
    
    var body: some View{
        NavigationStack{
                HStack{
                    
                    ZStack{
                        Circle()
                            .fill(customColor)
                            .opacity(0.9)
                            .frame(width: 50, height: 35)
                            .padding(.top,10)
                        Text("1")
                            .foregroundColor(.black)
                            .offset(y: 5)
                            .opacity(0.1)
                    }//end first Zstack
                    
                    ZStack{
                        Circle()
                            .fill(customColor)
                            .opacity(0.9)
                            .frame(width: 50, height: 35)
                            .padding(.top,10)
                        Text("2")
                            .foregroundColor(.black)
                            .offset(y: 5)
                    }//end second ZStack
                    
                    ZStack{
                        Circle()
                            .fill(customColor)
                            .opacity(0.9)
                            .frame(width: 50, height: 35)
                            .padding(.top,10)
                        Text("3")
                            .foregroundColor(.black)
                            .offset(y: 5)
                            .opacity(0.1)
                    }//end third ZStack
                } //END CODICE PALLINI
            
            //BODY:
            VStack() {
                Text("Who are you traveling with?")
                    .font(.title).bold()
                    .padding(.top, 40)
                
            
                
                //List per inserire le choices
                List(0..<answers.count, id: \.self) { index in
                    Button(action: {//for multiple choices
                        if selectedAnswer.contains(index){
                            selectedAnswer.remove(index)
                        }
                        else{
                            selectedAnswer.insert(index)
                        }
                    }) {
                        HStack {
                            //Una sorta di 'if?', : = OR
                            Image(systemName: selectedAnswer.contains(index) ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(selectedAnswer.contains(index) ? .blue : .gray)
                            
                                
                                .font(.title)
                                .padding()
                            
                            Text(answers[index])
                                .font(.headline)
                        }//End HStack
                        
                    }//End Button
                    .buttonStyle(PlainButtonStyle())
                }.padding()
                    .cornerRadius(63)
                //Lista finita
                
                Spacer()
                
                //Next Page:
                NavigationLink(destination: FourthView(Page: $Page)){
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }.padding()
            }//end VStack
            
            
        }
    }
}


//------------------------------

//Struct Page 4

struct FourthView: View{
    @Binding var Page: Int
    @State private var selectedAnswer: Set <Int> = []
    let customColor = Color(red: 223/255, green: 194/255, blue: 194/255)
    
    var body: some View{
        NavigationStack{
            HStack{
                
                ZStack{
                    Circle()
                        .fill(customColor)
                        .opacity(0.9)
                        .frame(width: 50, height: 35)
                        .padding(.top,10)
                    Text("1")
                        .foregroundColor(.black)
                        .offset(y: 5)
                        .opacity(0.1)
                }//end first Zstack
                
                ZStack{
                    Circle()
                        .fill(customColor)
                        .opacity(0.9)
                        .frame(width: 50, height: 35)
                        .padding(.top,10)
                    Text("2")
                        .foregroundColor(.black)
                        .offset(y: 5)
                        .opacity(0.1)
                }//end second ZStack
                
                ZStack{
                    Circle()
                        .fill(customColor)
                        .opacity(0.9)
                        .frame(width: 50, height: 35)
                        .padding(.top,10)
                    Text("3")
                        .foregroundColor(.black)
                        .offset(y: 5)
                }//end third ZStack
            } //END CODICE PALLINI
//            .padding(.bottom, 280)
            
            
            VStack{
                Text("Select your dates")
                    .font(.title).bold()
                    .padding(.top, 180)
                DatePicker(selection: .constant(Date()), label: { Text("Da") })
                    .padding()
                DatePicker(selection: .constant(Date()), label: { Text("A") })
                    .padding()
                
                NavigationLink(destination: PicView(Page: $Page)){
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }.padding(.top, 200)
                
            }//End VStack

        }//End NAV
     
        //NEL CASO IN CUI SI VOGLIA METTERE PROPRIO LA VIEW DEL CALENDARIO:
        // MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)
    }
}

//--------------------------------------------------------

//"Carica Foto" page

struct PicView: View{
    //Attributi
    @Binding var Page: Int
    @State private var image: UIImage? = nil
    @State private var showImagePicker = false
    
    
    //Body
    var body: some View{
        NavigationStack{
            ZStack{
                //ZStack per consentire la visualizzazione dell'immagine selezionata se image è diverso da nil, altrimenti viene visualizzato un pulsante per avviare il selettore di immagini.
                Text("Upload your photo")
                    .font(.title).bold()
                    .padding(.bottom, 300)
                
                if let image = image{ //Se viene selezionata un'immagine, la si mette in un cerchio
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                        .shadow(radius: 4)
                }
                else{//se non viene selezionata alcuna immagine, visualizzo il bottone '+' per inserire, appunto, l'immagine
                    Button(action: {
                        showImagePicker = true
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue)
                    }//end Button
                    
                }
            }//End ZStack
            .sheet(isPresented: $showImagePicker){
                ImagePickerView(image: $image, showImagePicker: $showImagePicker)
            }
            
            VStack{//Codice "Next"
                NavigationLink(destination: LastView(Page: $Page)){
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }.padding()
        }
    }
}

//-------------------

//Ultima view:
struct LastView: View{
    //Att.:
    @Binding var Page: Int
    
    
    //Body:
    var body: some View{
        NavigationStack{
            VStack{
                Text("Profile created!")
                    .font(.system(size: 30)).bold()
                    
                Text("You can change your choices in Profile")
                    .padding()
                
                //Codice Link alla Home
                
            }//end VStack
        }//End Nav
    }
}

//-------------------------

//Codice Picker immagine
struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var showImagePicker: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let pickedImage = info[.originalImage] as? UIImage {
                parent.image = pickedImage
            }
            parent.showImagePicker = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.showImagePicker = false
        }
    }
}//END CODICE PICKER


//--------------------------------------------------------
struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}
