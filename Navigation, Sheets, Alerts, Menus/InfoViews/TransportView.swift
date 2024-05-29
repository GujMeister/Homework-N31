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
    
    var body: some View {
        VStack {
            Text(transport)
                .padding()
            Button(action: {
                path.removeLast(path.count)
            }) {
                Text("Go to main screen")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
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
