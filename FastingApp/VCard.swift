//
//  VCard.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//


import SwiftUI

struct VCard: View {
    var foodfact: Foodfact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(foodfact.title)
                .customFont(.title2)
                .frame(maxWidth: 170, alignment: .leading)
                .layoutPriority(1)
            Text(foodfact.subtitle)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(foodfact.caption.uppercased())
                .customFont(.footnote2)
                .opacity(0.7)
            Spacer()
            HStack {
                ForEach(Array([4, 5, 6].shuffled().enumerated()), id: \.offset) { index, number in
                    Image("Avatar \(number)")
                        .resizable()
                        .mask(Circle())
                        .frame(width: 44, height: 44)
                        .offset(x: CGFloat(index * -20))
                }
            }
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 260, height: 310)
        .background(.gray)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: foodfact.color.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: foodfact.color.opacity(0.3), radius: 2, x: 0, y: 1)
        
    }
}

struct VCard_Previews: PreviewProvider {
    static var previews: some View {
        VCard(foodfact: foodfacts[1])
    }
}
