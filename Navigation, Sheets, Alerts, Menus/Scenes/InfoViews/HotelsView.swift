//
//  HotelsView.swift
//  Navigation, Sheets, Alerts, Menus
//
//  Created by Luka Gujejiani on 29.05.24.
//

import SwiftUI

struct HotelsView: View {
    
    @State var hotelsDictionary: [String: String]
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            HStack {
                Text("Recommended Hotels")
                    .font(.title)
                    .bold()
                    .padding()
                
                Spacer()
            }
            
            ForEach(Array(hotelsDictionary.keys), id: \.self) { key in
                if let url = hotelsDictionary[key] {
                    HStack {
                        Text(key)
                            .font(.headline)
                            .padding(.bottom, 2)
                        
                        Spacer()
                        
                        Button {
                            if let url = URL(string: url) {
                                UIApplication.shared.open(url)
                            }
                        } label: {
                            HStack {
                                Image(systemName: "house")
                                    .font(.system(size: 20, weight: .regular))
                                Text("AirBNB")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .foregroundColor(Color(UIColor.systemBackground))
                            .padding()
                            .frame(width: 200)
                            .background(Color(red: 255 / 255.0, green: 90 / 255.0, blue: 95 / 255.0))
                            .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            Spacer()
            
            (Text("Disclaimer:").foregroundColor(.red) + Text(" Hotels selected here are based on no real factual basis at all. All the information presented in this application was made up by a person who lacks sleep and proper nutrition. All hail King Julien from Madagascar"))
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                path.removeLast(path.count)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.53, green: 0.44, blue: 1))
                        .frame(width: 200, height: 70)
                    Text("Go to main screen")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

// MARK: - Preview setup
#Preview {
    HotelsViewPreview()
}

struct HotelsViewPreview: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        HotelsView(hotelsDictionary: [
            "Hôtel Ritz Paris": "https://www.airbnb.com/rooms/12345",
            "Le Meurice": "https://www.airbnb.com/rooms/67890"
        ],
                   path: $path)
    }
}

