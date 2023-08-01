//
//  MapsView.swift
//  PrototipoApp1
//
//  Created by Mario Cipolletta on 30/05/23.
//

import SwiftUI
import MapKit


struct MapsView: View {
    @ObservedObject var myData = appData
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.8517746, longitude: 14.2681244),
        latitudinalMeters: 2500,
        longitudinalMeters: 5000)
    
    
    @State var showActivity = false
    @State var actualActivity: Activity = appData.pinList[0]
    @State private var isPickerVisible = false
    @State private var selectedCategory = ActivityCategory.all
    
    var filteredActivities: [Activity] {
        if selectedCategory != ActivityCategory.all {
            return myData.pinList.filter { activity in
                activity.category == selectedCategory
            }
        } else {
            return myData.pinList
        }
    }
    
    func searchIndex( _ target: Activity) -> Int? {
        for (index, element) in myData.pinList.enumerated() {
            if element == target {
                return index
            }
        }
        return nil
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack(alignment: .topTrailing){ // mi posiziona gli elementi partendo dal bordo destro serve per l'offset del button
                    Map(coordinateRegion: $region, annotationItems: filteredActivities)
                        { activity in
                                MapAnnotation(coordinate: activity.coordinate){
                                    Image(systemName: "mappin.circle.fill").foregroundColor(.red)
                                        .onTapGesture {
                                            showActivity = true
                                            actualActivity = activity
                                        }
                                }
                    }
                    VStack {
                        Spacer()
                        if isPickerVisible {
                            CategoryMenu(selectedCategory: $selectedCategory, isPickerVisible: $isPickerVisible)
                                .background(Color.clear)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 20)
                            
                        } else {
                            Button(action: {
                                isPickerVisible.toggle() //toggle passa da trua a false o viceversa
                            }) {
                                Image(systemName: "ellipsis")
                                    .imageScale(.large)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                            }
                            .offset(x: -20, y: -20)
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.top) //Vedi come ignorare solo quelli alti
            
            .sheet(isPresented: $showActivity){
                var indice = searchIndex(actualActivity)
                activityView(indice: indice ?? 0)
            }
            //
        }
    }
}
    
struct CategoryMenu: View {
    @Binding var selectedCategory: ActivityCategory
    @Binding var isPickerVisible: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                Button(action: {
                    selectedCategory = .sport
                }) {
                    Image(systemName: "figure.run.circle")
                        .imageScale(.large)
                }
                .font(.system(size: 30))
//                .padding(.leading)
//                .buttonStyle(PlainButtonStyle())
                Spacer()
            Button(action: {
                    selectedCategory = .food
                }) {
                    Image(systemName:"fork.knife.circle")
                        .imageScale(.large)
                    
                }
                .font(.system(size: 30))
                Spacer()
            Button(action: {
                selectedCategory = .culture
            }) {
                Image(systemName: "building.columns.circle")
                    .imageScale(.large)
            }
            .font(.system(size: 30))
                Spacer()
            Button(action: {
                selectedCategory = .all
            }) {
                Image(systemName: "eraser")
            }
            .font(.system(size: 30))
                Spacer()
                Button(action: {
                    isPickerVisible = false
                }) {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
        }
        .background(Color.white)
        .cornerRadius(40)
        .shadow(radius: 5)
        }
        .background(Color.clear)
    }
}


struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
