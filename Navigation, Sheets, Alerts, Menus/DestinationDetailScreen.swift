//
//  DestinationDetailScreen.swift
//  Navigation, Sheets, Alerts, Menus
//
//  Created by Luka Gujejiani on 29.05.24.
//

import SwiftUI

struct DestinationDetailScreen: View {
    
    let destination: Destination
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(destination.name)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                
                HStack {
                    ForEach(destination.pictures, id: \.self) { picture in
                        Image(picture)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                }
                
                Text(destination.info)
                    .padding(.bottom, 10)
                
                VStack {
                    NavigationLink(value: DestinationType.transport(destination.transport)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20.0)
                                .fill(Color(red: 0.53, green: 0.44, blue: 1))
                            Text("Transport")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .frame(height: 50)
                    
                    NavigationLink(value: DestinationType.mustSeePlaces(destination.mustSeePlaces)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20.0)
                                .fill(Color(red: 0.53, green: 0.44, blue: 1))
                            Text("Must See")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .frame(height: 50)
                    
                    NavigationLink(value: DestinationType.hotels(destination.hotels)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20.0)
                                .fill(Color(red: 0.53, green: 0.44, blue: 1))
                            Text("Hotels")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .frame(height: 50)
                }
                .padding()
            }
            .padding()
        }
//        
//        .navigationDestination(for: String.self) { transport in
//            TransportView(transport: transport, path: $path)
//        }
//        
//        .navigationDestination(for: [String: String].self) { mustSeePlaces in
//            MustSeeView(mustSee: mustSeePlaces, path: $path)
//        }
//        
//        .navigationDestination(for: [String: String].self) { hotels in
//            HotelsView(hotelsDictionary: hotels, path: $path)
//        }
        
    }
}


// MARK: - Preview setup
//#Preview {
//    DestinationDetailScreenPreview()
//}
//
//struct DestinationDetailScreenPreview: View {
//    @State private var path = NavigationPath()
//
//    var body: some View {
//        DestinationDetailScreen(destination: Destination(
//            name:
//                "Paris, France",
//            pictures:
//                ["paris1", "paris2"],
//            info:
//                "Paris, the capital of France, is known for its art, fashion, and culture. Famous landmarks include the Eiffel Tower, Notre-Dame Cathedral, and the Louvre Museum.",
//            transport:
//                "Public transport in Paris includes buses, trams, and the metro. The Paris Metro is one of the fastest ways to get around the city.",
//            mustSeePlaces:
//                ["Eiffel Tower", "Louvre Museum", "Notre-Dame Cathedral", "Champs-Élysées"],
//            hotels: ["Hôtel Ritz Paris (https://www.airbnb.com/rooms/12345)", "Le Meurice (https://www.airbnb.com/rooms/67890)"]
//        ),
//            path: $path)
//    }
//}
