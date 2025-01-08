//
//  CategoryView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    var category: Category
    
    var recipes: [Recipe] {
        return recipesVM.recipes.filter{ $0.category == category.rawValue}
    }
    var body: some View {
        ScrollView {
            RecipeList(recipes: recipes)
        }
        .navigationTitle(category.rawValue + "s")
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView( category: Category.dessert)
            .environmentObject(RecipeViewModel())
    }
}

