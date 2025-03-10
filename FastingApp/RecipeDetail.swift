//
//  RecipeDetail.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//


import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.image)) {
                image in image
                    .cornerRadius(20)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .frame(height: 300)
            
            .cornerRadius(20)
            
            VStack(spacing:30) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 30) {
                    if !recipe.description.isEmpty {
                        Text(recipe.description)
                    }
                    
                    if !recipe.description.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Ingredients")
                                .font(.headline)
                            
                            Text(recipe.ingredients)
                        }
                    }
                    
                    if !recipe.description.isEmpty {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Directions")
                                .font(.headline)
                            
                            Text(recipe.directions)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}
struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
            RecipeDetail(recipe: Recipe.all[7])
    }
}
