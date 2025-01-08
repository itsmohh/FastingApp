//
//  CategoriesView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//


import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases) {
                    category in
                    NavigationLink {
                        ScrollView {
                            RecipeList(recipes: recipesVM.recipes.filter { $0.category == category.rawValue})
                        }
                        .navigationTitle(category.rawValue + "s")
                    } label : {
                        Text(category.rawValue + "s")
                    }
                    
                }
            }
            .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(RecipeViewModel())
    }
}
