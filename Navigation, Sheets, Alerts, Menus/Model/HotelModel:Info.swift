//
//  HotelModel:Info.swift
//  Navigation, Sheets, Alerts, Menus
//
//  Created by Luka Gujejiani on 29.05.24.
//

import SwiftUI

struct Destination: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let pictures: [String]
    let info: String
    let transport: String
    let mustSeePlaces: [String: String]
    let hotels: [String: String]
}

enum DestinationType: Hashable {
    case detail(Destination)
    case transport(String)
    case mustSeePlaces([String: String])
    case hotels([String: String])
}
