//
//  FastingView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct FastingView: View {
      @EnvironmentObject var fastingManager: FastingManager
    
    @State private var selectedPlan = FastingPlan.beginner
    
    var title: String {
        switch fastingManager.fastingState {
            
        case .notStarted:
            return ""
        case .Fasting:
            return "You are now fasting"
        case .feeding:
            return "You are now feeding"
        }
    }
    var body: some View {
        ZStack {
            // MARK: Background
            
            BackgroundView()
            
            content
        }
    }
    var content: some View {
        ZStack {
            
            VStack(spacing: 40) {
                
                // MARK: Title
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                //MARK: Fasting Plan
                
                
                Picker("Select Fasting Plan", selection: $selectedPlan) {
                    ForEach(FastingPlan.allCases, id: \.self) { plan in
                        Text(plan.rawValue).tag(plan)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 24)
                .padding(.vertical ,8)
                .background(.thinMaterial)
                .cornerRadius(20)
                .onChange(of: selectedPlan) { newPlan in
                    fastingManager.updateFastingPlan(to: newPlan)
                    
                    Spacer()
                    // MARK: Progress Ring
                    
                    
                }
                .padding()
                
                VStack(spacing: 40) {
                    
                    ProgressRing()
                        .environmentObject(fastingManager)
                    
                    HStack(spacing: 60) {
                        //MARK: Start Time
                        
                        VStack(spacing: 5) {
                            Text(fastingManager.fastingState == .notStarted ? "Start" : "Started")
                                .opacity(0.7)
                            
                            Text(fastingManager.startTime, format: .dateTime.weekday().hour().minute().second())
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        //MARK: End Time
                        
                        VStack(spacing: 5) {
                            Text(fastingManager.fastingState == .notStarted ? "End" : "Ends")
                                .opacity(0.7)
                            
                            Text(fastingManager.endTime.addingTimeInterval(16), format: .dateTime.weekday().hour().minute().second())
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                    }
                    //MARK: Button
                    
                    Button{
                        fastingManager.toggleFastingState()
                    } label: {
                        Text(fastingManager.fastingState == .Fasting ? "End Fast" : "Start fasting")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal, 24)
                            .padding(.vertical ,8)
                            .background(.thinMaterial)
                            .cornerRadius(20)
                    }
                    
                }
                .padding()
            }
            .foregroundColor(.black)
            
        }
    }
}


struct FastingView_Previews: PreviewProvider {

  static var previews: some View {
    FastingView()
          .environmentObject(FastingManager())
  }
}
