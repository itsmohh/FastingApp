//
//  CircleBackground.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct CircleBackground: View {
    @State var color: Color = Color(.yellow)
    var body: some View {
       Circle()
            .frame(width: 300.0, height: 300.0)
            .foregroundColor(color)
    }
}

struct CircleBackground_Previews: PreviewProvider {
    static var previews: some View {
        CircleBackground()
    }
}
