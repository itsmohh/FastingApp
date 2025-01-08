//
//  FoodFact.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct Foodfact: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var caption: String
    var color: Color
    var image: Image
}

var foodfacts = [
    Foodfact(title: "Fasting induces ketosis, promoting rapid fat loss.", subtitle: "Join other people today as you learn and improve your overall health today! ", caption: "20 sections - 3 hours", color: Color("7850F0"), image: Image("Topic 1")),
    Foodfact(title: "Fasting may inhibit cancer cell growth", subtitle: "Let's build a strong community today and strive for our best version", caption: "47 sections - 11 hours", color: Color("7850F0"), image: Image("Topic 22"))
]
