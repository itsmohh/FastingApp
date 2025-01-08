//
//  CustomTabView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct CustomTabView: View {
        @Binding var tabSelection: Int
        @Namespace private var animationNamespaace
        
        let tabBarItems: [(image: String, title: String)] = [
            ("home", "Home"),
            ("fasting", "Fasting"),
            ("history", "History"),
            ("recipe", "Recipes")
        ]
        var body: some View {
            ZStack {
                Capsule()
                    .frame(height: 80)
                    .foregroundColor(.gray)
                    .shadow(radius: 2)
                
                HStack {
                    ForEach(0..<4) {index in
                        Button {
                            tabSelection = index + 1
                        } label: {
                            VStack(spacing: 8) {
                                Spacer()
                                
                                Image(tabBarItems[index].image)
                                
                                Text(tabBarItems[index].title)
                                    .font(.caption)
                                
                                if index + 1 == tabSelection {
                                    Capsule ()
                                        .frame(height: 8)
                                        .foregroundColor(.black)
                                        .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespaace)
                                        .offset(y: 3)
                                } else {
                                    Capsule()
                                        .frame(height: 8)
                                        .foregroundColor(.clear)
                                        .offset(y: 3)
                                }
                            }
                            .foregroundColor(index + 1 == tabSelection ? .white : .black)
                        }
                    }
                }
                .frame(height: 80)
                .clipShape(Capsule())
            }
            .padding(.horizontal)
        }
    }

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabSelection: .constant(1))
                .previewLayout(.sizeThatFits)
                .padding(.vertical)
                .environmentObject(RecipeViewModel())
    }
}
