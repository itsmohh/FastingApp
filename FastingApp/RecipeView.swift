//
//  RecipeView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    RecipeList(recipes: recipesVM.recipes)
                
                    Spacer()
                   
                        NavigationLink(destination: CategoriesView()) {
                            Text("Categories")
                                .padding(16)
                                .padding(.horizontal, 8)
                                .background(.white)
                                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .foregroundStyle(.primary)
                                .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
                        }
                }
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)

    }
}


struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
            .environmentObject(RecipeViewModel())
    }
}
