//
//  RecipeCard.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    var body: some View {
        
            VStack {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment: .bottom) {
                            Text(recipe.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                                .shadow(color: .black, radius: 3, x: 0, y: 0)
                                .frame(maxWidth: 136)
                                .padding()
                        }
                        .cornerRadius(20)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(alignment: .bottom) {
                            Text(recipe.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                                .shadow(color: .black, radius: 3, x: 0, y: 0)
                                .frame(maxWidth: 136)
                                .padding()
                        }
                        
                }
            }
            .scaledToFit()
            .frame(width: 190, height: 100, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        }
    }

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.all[0])
    }
}
