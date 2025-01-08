//
//  FastingHistoryView.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import SwiftUI

struct FastingHistoryView: View {
    @EnvironmentObject var fastingManager: FastingManager
    
    var body: some View {
        VStack {
            Text("Fasting History")
                .font(.title)
                List(fastingManager.fastingSessions) { session in
                    VStack(alignment: .leading) {
                        Text("Start Time: \(session.startTime.formatted(.dateTime.month().day().hour().minute().second()))")
                        Text("End Time: \(session.endTime.formatted(.dateTime.month().day().hour().minute().second()))")
                        Text("State: \(session.fastingState == .Fasting ? "Fasting" : "Feeding")")
                    }
                }
        }
    }
}


struct FastingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        FastingHistoryView()
            .environmentObject(FastingManager())
    }
}
