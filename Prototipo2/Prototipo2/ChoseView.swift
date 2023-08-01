//
//  ChoseView.swift
//  PrototipoApp1
//
//  Created by Mario Cipolletta on 05/06/23.
//

import SwiftUI


struct ChoseView: View {
    
    @ObservedObject var myData = appData
    
    @State var description = "- Host can create their own event \n- User can discover the events \n   around them "
    @State var choice = 1
    @State var opacityHost = 1.0
    @State var opacityUser = 1.0
    @State var reset = true

    
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    //                    Spacer()
                    ZStack{
                        Button(action: {
                            description = "Host information..."
                            opacityHost = 1
                            opacityUser = 0.3
                            choice = 3
                            reset = false
                        }){Text("Host")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .frame(width: screenSize.width*0.4, height: screenSize.width*0.4)
                    .background(.blue)
                    .opacity(opacityHost)
                    .cornerRadius(20)
                    .padding()
                    
                    ZStack{
                        Button(action: {
                            description = "User information..."
                            opacityHost = 0.3
                            opacityUser = 1
                            choice = 2
                            reset = false
                            
                        }){Text("User")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    
                    .frame(width: screenSize.width*0.4, height: screenSize.width*0.4)
                    .background(.blue)
                    .cornerRadius(20)
                    .opacity(opacityUser)
                    .padding()
                    
                    
                }
                .padding()
                Text(description)
                    .frame(width: screenSize.width, height: screenSize.height*0.2)
                    .font(.system(size: 20))
                    .padding()
                                
                Button(action: {
                    if(reset){
                        UserDefaults.standard.set(true, forKey: "hasVisitedApp")
                    }
                    myData.globalTab = choice
                }) {
                            Text("Submit")
                                .font(.title)
                                .frame(width: screenSize.width*0.5, height: screenSize.height * 0.06)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                
            }
            .navigationTitle("Chose your role")
        }
        
    }
}

struct ChoseView_Previews: PreviewProvider {
    static var previews: some View {
        ChoseView()
    }
}
