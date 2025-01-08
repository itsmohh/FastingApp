//
//  NewRecipeView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView {
            Button("Add recipe manually") {
                showAddRecipe =  true
            }
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe, content: {
            AddRecipeView()
        })
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}

