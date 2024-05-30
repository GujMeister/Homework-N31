//
//  DestinationType.swift
//  Navigation, Sheets, Alerts, Menus
//
//  Created by Luka Gujejiani on 30.05.24.
//

import Foundation

enum DestinationType: Hashable {
    case detail(Destination)
    case transport(String)
    case mustSeePlaces([String: String])
    case hotels([String: String])
}
