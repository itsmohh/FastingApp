//
//  RecipeViewModel.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    
    init () {
        recipes = Recipe.all
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
}
