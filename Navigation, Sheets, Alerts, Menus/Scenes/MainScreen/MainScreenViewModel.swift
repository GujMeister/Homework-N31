//
//  MainScreenViewModel.swift
//  Navigation, Sheets, Alerts, Menus
//
//  Created by Luka Gujejiani on 30.05.24.
//

import SwiftUI

class MainScreenViewModel: ObservableObject {
    @Published var destinations: [Destination] = []
    @Published var path = NavigationPath()
    @Published var showAlert = false
    @Published var selectedTip = ""
    @Published var travelTips = [
            "Pack light to make your travels easier and more enjoyable.",
            "Always carry a portable charger to keep your devices powered.",
            "Learn basic phrases in the local language to enhance your experience.",
            "Keep copies of important documents like your passport and ID.",
            "Try local foods to get a taste of the culture.",
            "Stay hydrated, especially when exploring new cities.",
            "Use a money belt or hidden pouch to keep your valuables safe.",
            "Download offline maps to navigate without an internet connection.",
            "Take lots of photos but also take time to enjoy the moment.",
            "Be flexible and open to changes in your travel plans."
        ]
    
    init() {
        loadDestinations()
        print("Init done")
    }
    
    func showRandomTip() {
        if let tip = travelTips.randomElement() {
            selectedTip = tip
            showAlert = true
        }
    }
    
    private func loadDestinations() {
        self.destinations =  [
            Destination(
                name: "Paris, France",
                pictures: ["paris1", "paris2"],
                info: "Paris, the capital of France, is celebrated for its rich history, art, and fashion. It is home to world-renowned landmarks like the Eiffel Tower and the Louvre Museum. The city's charming streets, cafes, and cultural events make it a top destination for travelers.",
                transport: "Public transport in Paris includes buses, trams, and the metro. The Paris Metro is one of the fastest and most efficient ways to get around the city, with extensive coverage and frequent services.",
                mustSeePlaces: [
                    "Eiffel Tower": "https://en.wikipedia.org/wiki/Eiffel_Tower",
                    "Louvre Museum": "https://en.wikipedia.org/wiki/Louvre",
                    "Notre-Dame Cathedral": "https://en.wikipedia.org/wiki/Notre-Dame_de_Paris",
                    "Champs-Élysées": "https://en.wikipedia.org/wiki/Champs-Élysées"
                ],
                hotels: [
                    "Hôtel Ritz Paris": "https://www.airbnb.com/rooms/12345",
                    "Le Meurice": "https://www.airbnb.com/rooms/67890"
                ]
            ),
            Destination(
                name: "Tokyo, Japan",
                pictures: ["tokyo1", "tokyo2"],
                info: "Tokyo, the bustling capital of Japan, seamlessly blends tradition and modernity. Famous for its skyscrapers, shopping districts, and culinary delights, Tokyo offers a unique experience with its historical temples, vibrant nightlife, and cutting-edge technology.",
                transport: "Tokyo has an extensive public transportation system, including subways, trains, and buses. The JR Yamanote Line is particularly convenient for getting around the city, connecting many major districts and attractions.",
                mustSeePlaces: [
                    "Shinjuku": "https://en.wikipedia.org/wiki/Shinjuku",
                    "Shibuya Crossing": "https://en.wikipedia.org/wiki/Shibuya_Crossing",
                    "Tokyo Tower": "https://en.wikipedia.org/wiki/Tokyo_Tower",
                    "Asakusa": "https://en.wikipedia.org/wiki/Asakusa"
                ],
                hotels: [
                    "Park Hyatt Tokyo": "https://www.airbnb.com/rooms/54321",
                    "Hotel New Otani": "https://www.airbnb.com/rooms/98765"
                ]
            ),
            Destination(
                name: "New York City, USA",
                pictures: ["nyc1", "nyc2"],
                info: "New York City, often simply called New York, is the largest city in the USA. Known for its iconic skyline, Broadway theaters, and cultural diversity, it is a must-visit destination for travelers seeking an urban adventure filled with world-class attractions.",
                transport: "Public transportation in NYC includes subways, buses, and ferries. The NYC subway is the most efficient way to get around the city, operating 24/7 and covering all boroughs with extensive lines.",
                mustSeePlaces: [
                    "Statue of Liberty": "https://en.wikipedia.org/wiki/Statue_of_Liberty",
                    "Central Park": "https://en.wikipedia.org/wiki/Central_Park",
                    "Times Square": "https://en.wikipedia.org/wiki/Times_Square",
                    "Empire State Building": "https://en.wikipedia.org/wiki/Empire_State_Building"
                ],
                hotels: [
                    "The Plaza Hotel": "https://www.airbnb.com/rooms/11223",
                    "The Ritz-Carlton New York": "https://www.airbnb.com/rooms/33445"
                ]
            ),
            Destination(
                name: "Rome, Italy",
                pictures: ["rome1", "rome2"],
                info: "Rome, the capital of Italy, is known for its nearly 3,000 years of globally influential art, architecture, and culture. Its ancient ruins and vibrant street life make it a unique destination, offering travelers a journey through history and contemporary Italian life.",
                transport: "Rome's public transport includes buses, trams, and metro lines. The metro is the quickest way to travel around the city, providing fast and frequent services to key locations.",
                mustSeePlaces: [
                    "Colosseum": "https://en.wikipedia.org/wiki/Colosseum",
                    "Vatican City": "https://en.wikipedia.org/wiki/Vatican_City",
                    "Trevi Fountain": "https://en.wikipedia.org/wiki/Trevi_Fountain",
                    "Pantheon": "https://en.wikipedia.org/wiki/Pantheon,_Rome"
                ],
                hotels: [
                    "Hotel Eden": "https://www.airbnb.com/rooms/55678",
                    "Hotel de Russie": "https://www.airbnb.com/rooms/77889"
                ]
            ),
            Destination(
                name: "Sydney, Australia",
                pictures: ["sydney1", "sydney2"],
                info: "Sydney, known for its Sydney Opera House, Harbour Bridge, and beautiful beaches, is Australia's largest city. It offers a vibrant cultural scene, excellent dining options, and stunning natural beauty, making it a popular destination for both relaxation and adventure.",
                transport: "Sydney's public transport includes trains, buses, ferries, and light rail. The ferry rides offer spectacular views of the city and the harbor, making it a scenic and enjoyable way to travel.",
                mustSeePlaces: [
                    "Sydney Opera House": "https://en.wikipedia.org/wiki/Sydney_Opera_House",
                    "Sydney Harbour Bridge": "https://en.wikipedia.org/wiki/Sydney_Harbour_Bridge",
                    "Bondi Beach": "https://en.wikipedia.org/wiki/Bondi_Beach",
                    "The Rocks": "https://en.wikipedia.org/wiki/The_Rocks,_Sydney"
                ],
                hotels: [
                    "Shangri-La Hotel Sydney": "https://www.airbnb.com/rooms/88900",
                    "The Langham Sydney": "https://www.airbnb.com/rooms/99012"
                ]
            ),
            Destination(
                name: "Barcelona, Spain",
                pictures: ["barcelona1", "barcelona2"],
                info: "Barcelona, the capital of Catalonia, is renowned for its art and architecture. The city features spectacular buildings by Antoni Gaudí, vibrant street life, beautiful beaches, and a rich cultural heritage, making it a top travel destination in Europe.",
                transport: "Public transport in Barcelona includes buses, trams, and the metro. The metro is the most efficient way to get around the city, providing extensive coverage and frequent service.",
                mustSeePlaces: [
                    "Sagrada Família": "https://en.wikipedia.org/wiki/Sagrada_Família",
                    "Park Güell": "https://en.wikipedia.org/wiki/Park_Güell",
                    "La Rambla": "https://en.wikipedia.org/wiki/La_Rambla,_Barcelona",
                    "Gothic Quarter": "https://en.wikipedia.org/wiki/Gothic_Quarter,_Barcelona"
                ],
                hotels: [
                    "W Barcelona": "https://www.airbnb.com/rooms/123456",
                    "Majestic Hotel & Spa": "https://www.airbnb.com/rooms/789012"
                ]
            ),
            Destination(
                name: "Cape Town, South Africa",
                pictures: ["capetown1", "capetown2"],
                info: "Cape Town is known for its stunning harbor, Table Mountain, and Cape Point. The city combines a rich history with a vibrant cultural scene, offering travelers a diverse range of experiences from outdoor adventures to exploring historical sites.",
                transport: "Public transport in Cape Town includes buses and trains. The MyCiTi bus service is a convenient way to travel around the city, providing reliable and safe transportation to key areas.",
                mustSeePlaces: [
                    "Table Mountain": "https://en.wikipedia.org/wiki/Table_Mountain",
                    "Robben Island": "https://en.wikipedia.org/wiki/Robben_Island",
                    "V&A Waterfront": "https://en.wikipedia.org/wiki/V&A_Waterfront",
                    "Cape Point": "https://en.wikipedia.org/wiki/Cape_Point"
                ],
                hotels: [
                    "The Silo Hotel": "https://www.airbnb.com/rooms/345678",
                    "One&Only Cape Town": "https://www.airbnb.com/rooms/901234"
                ]
            ),
            Destination(
                name: "Rio de Janeiro, Brazil",
                pictures: ["rio1", "rio2"],
                info: "Rio de Janeiro is famed for its Copacabana and Ipanema beaches, the 38m Christ the Redeemer statue atop Mount Corcovado, and Sugarloaf Mountain. The city's vibrant culture, lively festivals, and stunning natural beauty make it a must-visit destination.",
                transport: "Public transport in Rio includes buses, metro, and trams. The metro is the fastest way to travel through the city, offering quick and efficient services to major areas.",
                mustSeePlaces: [
                    "Christ the Redeemer": "https://en.wikipedia.org/wiki/Christ_the_Redeemer_(statue)",
                    "Sugarloaf Mountain": "https://en.wikipedia.org/wiki/Sugarloaf_Mountain",
                    "Copacabana Beach": "https://en.wikipedia.org/wiki/Copacabana_(Rio_de_Janeiro)",
                    "Ipanema Beach": "https://en.wikipedia.org/wiki/Ipanema"
                ],
                hotels: [
                    "Belmond Copacabana Palace": "https://www.airbnb.com/rooms/567890",
                    "Hotel Fasano Rio de Janeiro": "https://www.airbnb.com/rooms/123678"
                ]
            ),
            Destination(
                name: "Istanbul, Turkey",
                pictures: ["istanbul1", "istanbul2"],
                info: "Istanbul, straddling Europe and Asia across the Bosphorus Strait, is known for its historic sites. The city offers a rich blend of cultural influences, with attractions like the Hagia Sophia, Blue Mosque, and Topkapi Palace showcasing its deep history and architectural beauty.",
                transport: "Public transport in Istanbul includes buses, trams, and ferries. The tram is a popular way to get around the city's historic areas, providing efficient and scenic transportation.",
                mustSeePlaces: [
                    "Hagia Sophia": "https://en.wikipedia.org/wiki/Hagia_Sophia",
                    "Blue Mosque": "https://en.wikipedia.org/wiki/Sultan_Ahmed_Mosque",
                    "Topkapi Palace": "https://en.wikipedia.org/wiki/Topkapı_Palace",
                    "Grand Bazaar": "https://en.wikipedia.org/wiki/Grand_Bazaar,_Istanbul"
                ],
                hotels: [
                    "Four Seasons Hotel Istanbul": "https://www.airbnb.com/rooms/234567",
                    "Ciragan Palace Kempinski": "https://www.airbnb.com/rooms/345678"
                ]
            ),
            Destination(
                name: "Santorini, Greece",
                pictures: ["santorini1", "santorini2"],
                info: "Santorini is known for its white-washed houses, blue-domed churches, and stunning sunsets. This picturesque island in the Aegean Sea offers breathtaking views, charming villages, and beautiful beaches, making it a popular destination for romantic getaways and relaxation.",
                transport: "Transport on Santorini includes buses, taxis, and rental vehicles. Buses are the most affordable way to get around the island, offering reliable service between major towns and attractions.",
                mustSeePlaces: [
                    "Oia": "https://en.wikipedia.org/wiki/Oia,_Santorini",
                    "Fira": "https://en.wikipedia.org/wiki/Fira",
                    "Red Beach": "https://en.wikipedia.org/wiki/Red_Beach_(Santorini)",
                    "Akrotiri": "https://en.wikipedia.org/wiki/Akrotiri_(Santorini)"
                ],
                hotels: [
                    "Katikies Hotel": "https://www.airbnb.com/rooms/456789",
                    "Canaves Oia Hotel": "https://www.airbnb.com/rooms/567890"
                ]
            )
        ]
    }
}
