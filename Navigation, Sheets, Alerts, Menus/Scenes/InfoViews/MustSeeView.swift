//
//  MustSeeView.swift
//  Navigation, Sheets, Alerts, Menus
//
//  Created by Luka Gujejiani on 29.05.24.
//

import SwiftUI

struct MustSeeView: View {
    
    let mustSee: [String: String]
    @Binding var path: NavigationPath
    
    var body: some View {
        
        HStack {
            Text("Must see places")
                .font(.largeTitle)
            .bold()
            
            Spacer()
        }
        .padding(.horizontal)
        
        VStack {
            ForEach(Array(mustSee.keys), id: \.self) { key in
                if let url = mustSee[key] {
                    VStack {
                        
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
                                    Image(systemName: "network")
                                        .font(.system(size: 20, weight: .regular))
                                    Text("Wikipedia")
                                        .font(.system(size: 20, weight: .bold))
                                }
                                .foregroundColor(Color(UIColor.systemBackground))
                                .padding()
                                .frame(width: 200)
                                .background(.blue)
                                .cornerRadius(20)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        Spacer()
        
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

// MARK: - Preview setup
#Preview {
    MustSeeViewPreview()
}

struct MustSeeViewPreview: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        MustSeeView(mustSee: [
            "Eiffel Tower": "https://en.wikipedia.org/wiki/Eiffel_Tower",
            "Louvre Museum": "https://en.wikipedia.org/wiki/Louvre",
            "Notre-Dame Cathedral": "https://en.wikipedia.org/wiki/Notre-Dame_de_Paris",
            "Champs-Élysées": "https://en.wikipedia.org/wiki/Champs-Élysées"
        ], path: $path)
    }
}
