//
//  BackgroundView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct BackgroundView: View {
@State var animate = false
var body: some View {
       ZStack {
       CircleBackground(color: Color(#colorLiteral(red: 0.4503333569, green: 0.479806006, blue: 0.7867927551, alpha: 1)))
           .blur(radius: animate ? 10 : 50)
            .offset(x: animate ? -50 : -130, y: animate ? 30 : -100)
               .task{
               withAnimation(.easeInOut(duration: 7).repeatForever()) {
               animate.toggle()
}
}
      CircleBackground(color: Color(#colorLiteral(red: 0.832731545, green: 0.1448588371, blue: 0.7387235165, alpha: 1)))
         .blur(radius: animate ? 10 : 50)
          .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)

                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
               
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(.white), Color(.white)]), startPoint: .top, endPoint: .bottom)
            )
            }
        }
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
