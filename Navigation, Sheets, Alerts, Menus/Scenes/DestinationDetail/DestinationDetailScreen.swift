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
                
                Text("  " + destination.info)
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
    }
}
