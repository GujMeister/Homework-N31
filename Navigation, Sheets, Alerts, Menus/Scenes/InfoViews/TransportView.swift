//
//  TransportView.swift
//  Navigation, Sheets, Alerts, Menus
//
//  Created by Luka Gujejiani on 29.05.24.
//

import SwiftUI

struct TransportView: View {
    
    let transport: String
    @Binding var path: NavigationPath
    @State private var animate = false
    
    var body: some View {
        VStack {
            Text("Transport")
                .font(.title)
                .bold()
            
            GeometryReader { geometry in
                HStack(spacing: 10) {
                    Text("🚎")
                    Text("🚋")
                    Text("🚌")
                    Text("🚕")
                }
                .font(.largeTitle)
                .offset(x: animate ? geometry.size.width - 180 : 0)
                .onAppear {
                    withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: true)) {
                        self.animate = true
                    }
                }
            }
            .frame(height: 50)
            
            Text("  " + transport)
                .font(.title3)
                .padding()
            
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
}

// MARK: - Preview setup
#Preview {
    TransportViewPreview()
}

struct TransportViewPreview: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        TransportView(transport: "Public transport in Paris includes buses, trams, and the metro. The Paris Metro is one of the fastest ways to get around the city.", path: $path)
    }
}
