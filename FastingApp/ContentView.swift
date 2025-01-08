//
//  ContentView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//
import SwiftUI

struct ContentView: View {
   
    @State private var tabSelection = (1)
    var body: some View {
       
               TabView(selection: $tabSelection)
               {
                   HomeView()
                       .tag(1)
                   
                   FastingView()
                       .tag(2)
                   
                FastingHistoryView()
                       .tag(3)
                   
                   RecipeView()
                       .tag(4)
                       
                   
               }
               .overlay(alignment: .bottom) {
   CustomTabView(tabSelection: $tabSelection) }
   }
}
