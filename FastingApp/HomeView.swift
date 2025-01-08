//
//  HomeView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var fastingManager: FastingManager
    var body: some View {
        ZStack {
            BackgroundView()
            
            ScrollView {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Nutrition Facts")
                    .customFont(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(foodfacts) { foodfact in
                        VCard(foodfact: foodfact)
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
            
            VStack {
                Text("Recent")
                    .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Feeding Period")
                                .customFont(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Feeding begins in:")
                                       Text("\(calculateTimeUntilFeeding()) minutes")
                        }
                        Divider()
                       
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity, maxHeight: 110)
                    .foregroundColor(.white)
                    .background(.blue)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Fasting Period")
                                .customFont(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Feeding started at:")
                            Text("\(formatDate(fastingManager.startTime))")
                        }
                        Divider()
                       
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity, maxHeight: 110)
                    .foregroundColor(.white)
                    .background(.blue)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                }
                                    
            }
            .padding(20)
            
        }
    }
    private func calculateTimeUntilFeeding() -> String {
           let currentDate = Date()
           let endTime = fastingManager.endTime
           
           let calendar = Calendar.current
           let components = calendar.dateComponents([.hour, .minute], from: currentDate, to: endTime)
           
           var timeString = ""
           
           if let hours = components.hour, hours > 0 {
               timeString += "\(hours) hrs"
           }
           
           if let minutes = components.minute, minutes > 0 {
               timeString += " \(minutes) mins"
           }
           
           return timeString.isEmpty ? "0 mins" : timeString
       }
    private func formatDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            return dateFormatter.string(from: date)
        }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FastingManager())

    }
}



