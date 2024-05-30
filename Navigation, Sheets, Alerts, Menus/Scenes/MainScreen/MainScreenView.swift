//
//  MainScreenView.swift
//  Navigation, Sheets, Alerts, Menus
//
//  Created by Luka Gujejiani on 28.05.24.
//

import SwiftUI

struct MainScreenView: View {
    
    @StateObject var viewModel = MainScreenViewModel()
//    @Namespace private var animationNamespace
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                Text("Choose Destination")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal, 20)
                    .bold()
                    .font(.system(size: 25))
                
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

/*
 ავაწყოთ Travel App



 MainScreenView
 გამოვიყენოთ NavigationStack, რათა ვაჩვენოთ travel destination-ების ლისტი მაგ:ბალი, სან ფრანცისკო, რეიკიავიკი.
 შესაბამის destination-ზე დაჭერისას უნდა გაიხსნას DestinationDetailScreen, NavigationLink-ის გამოყენებით.
 
 DestinationDetailScreen
 ვაჩვენოთ სურათი/სურათები სადაც გვინდა წასვლა და ზოგადი ინფორმაცია.
 გავაკეთოთ 3 ღილაკი (Transport, Must See, Hotels)
 ამ ღილაკზე დაჭერით გავხსნათ NavigationLink-ით გვერდი, რომელზეც შესაბამისი ინფორმაციები იქნება ამ ქალაქზე.
 
 
 
 NavigationStack
 დაამატეთ Transport, Must See და Hotels-ის გვერდებზე Go to main screen ღილაკი და navigation stack-ის დახმარებით დააბრუნდით MainScreen-ზე.
 
 
 
 Travel Tips
 MainScreen-ზე დაამატეთ ღილაკი Travel Tips-ის, რომელზეც დაჭერისას რანდომად რაღაც სამოგზაუროდ საჭირო Tips შემოგვთავაზებს და ალერტით ვაჩვენებთ.
 
 დაყავით კოდი მაქსიმალურად (ცალკე ვიუებად და ViewModel-ებად)

 დეითა შეგიძლია ხელით დამოკოთ.
 სასურველია რომ API-ები გააკეთოთ და ნეთვორქ ქოლებით ამუშაოთ. ანუ შექმნათ Mock JSON (https://mocki.io).

 ასევე კიდევ ერთი Optional შეგიძლიათ გვერდიდან გვერდზე გადასვლა გააკეთოთ სხვადასხვა ანიმაციებით.

  დავალებები ატვირთეთ zip-ის სახით.
 */
