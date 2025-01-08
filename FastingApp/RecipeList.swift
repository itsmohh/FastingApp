//
//  RecipeList.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                    .fontWeight(.medium)
                .opacity(0.7)
                
                Spacer()
                
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 0)], spacing: 15) {
                ForEach(recipes) {
                    recipe in
                    NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all)
        }
    }
}
