//
//  FastingAppApp.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//
import SwiftUI

@main
struct FastingAppApp: App {
    @StateObject var fastingManager = FastingManager() // Create the instance of FastingManager
    @StateObject var recipeViewModel = RecipeViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeViewModel)
                .environmentObject(fastingManager)
                
        }
    }
}
