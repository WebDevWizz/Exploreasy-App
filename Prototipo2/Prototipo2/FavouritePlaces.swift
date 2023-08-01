//
//  FavouritePlaces.swift
//  Prototipo2
//
//  Created by Mario Cipolletta on 06/06/23.
//

import SwiftUI

struct FavouritePlaces: View {
        
    @ObservedObject var myData = appData
    
    func searchIndex( _ target: Activity) -> Int? {
        for (index, element) in myData.pinList.enumerated() {
            if element == target {
                return index
            }
        }
        return nil
    }
    
   @State  var openActivity = false
    
    let screenSize = UIScreen.main.bounds.size
    
    var filteredActivities: [Activity] {
        return myData.pinList.filter { activity in
            activity.fav == true
        }
    }
    
   @State  var indice = 0
    
//    var RArray: [Activity]{
//        return filteredActivities.filter { activity in
//            ((searchIndex(activity) ?? 2) % 2) == 1
//        }
//    }
//
//    var LArray: [Activity]{
//        return filteredActivities.filter { activity in
//            ((searchIndex(activity) ?? 2) % 2) == 0
//        }
//    }
//
    var num: Int{
        if((filteredActivities.count % 2) == 0){
            return filteredActivities.count/2
        }else{
            return (filteredActivities.count + 1)/2
        }
    }
    
    let columns = [
        GridItem(.flexible(minimum: 30)),
        GridItem(.flexible(minimum: 30)),
    ]
    
    var body: some View {
            NavigationStack{
                if(filteredActivities.isEmpty){
                    VStack{
                        Image(systemName: "xmark.circle")
                        .font(.system(size:40))
                        .foregroundColor(.red)
                    Text("There are no favorite events")
                        .font(.system(size:30))
                    Text("Back to Discovery...")
                    }
                    .navigationTitle("Favourites")
                }else{
    //                AGGIUNGI DOMANI RIVEDI ALGORITMO 2 A 2
                    ScrollView{
                        VStack{
                            ScrollView(){
                                LazyVGrid(columns: columns, spacing: 20){
                                    ForEach(filteredActivities) { activity in
                                        ZStack{
                                            Image(activity.image)
                                                .resizable()
                                                .cornerRadius(20)
                                                .frame(width: 170, height: 190)
                                            Text(activity.name)
                                                .background(Color.white.opacity(0.8))
                                                .cornerRadius(5)
                                                
                                        }
                                        .onTapGesture {
                                            indice = searchIndex(activity) ?? 0
                                            openActivity = true
                                        }
                                    }
                                }
                                .padding(.top, 25)
                                .scrollIndicators(.hidden)
                            }
                            
                            Spacer()
                        }
                        .navigationTitle("Favourites")
                        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.7)
                    }
                }
                    
            }
            .sheet(isPresented: $openActivity ){
                activityView(indice: indice)
            }
        }
    
}



struct FavouritePlaces_Previews: PreviewProvider {
    static var previews: some View {
        FavouritePlaces()
    }
}
