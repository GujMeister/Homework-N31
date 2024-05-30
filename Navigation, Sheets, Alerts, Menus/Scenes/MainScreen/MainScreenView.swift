//
//  MainScreenView.swift
//  Navigation, Sheets, Alerts, Menus
//
//  Created by Luka Gujejiani on 28.05.24.
//

import SwiftUI

struct MainScreenView: View {
    
    @StateObject var viewModel = MainScreenViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                HStack {
                    Text("Choose Destination")
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .bold()
                        .font(.system(size: 25))
                    
                    Button(action: {
                        viewModel.showRandomTip()
                    }) {
                        Text("Travel Tips")
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.green)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    .alert("Travel Tip", isPresented: $viewModel.showAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text(viewModel.selectedTip)
                    }
                }
                .padding(.horizontal, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(viewModel.destinations, id: \.self) { destination in
                            NavigationLink(value: DestinationType.detail(destination)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(Color(red: 0.53, green: 0.44, blue: 1))
                                    
                                    HStack {
                                        Text(destination.name)
                                            .foregroundColor(.white)
                                            .padding(.leading)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .padding(.trailing)
                                    }
                                    .padding()
                                }
                            }
                            .frame(height: 75)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationDestination(for: DestinationType.self) { destinationType in
                switch destinationType {
                case .detail(let destination):
                    DestinationDetailScreen(destination: destination, path: $viewModel.path)
                case .transport(let transport):
                    TransportView(transport: transport, path: $viewModel.path)
                case .mustSeePlaces(let mustSeePlaces):
                    MustSeeView(mustSee: mustSeePlaces, path: $viewModel.path)
                case .hotels(let hotels):
                    HotelsView(hotelsDictionary: hotels, path: $viewModel.path)
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
}
