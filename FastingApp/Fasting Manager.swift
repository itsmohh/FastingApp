//
//  Fasting Manager.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//

import Foundation

enum FastingState {
    case notStarted
    case Fasting
    case feeding
}

enum FastingPlan: String, CaseIterable {
    case beginner = "12:12 -> Beginner"
    case intermediate = "16:8 -> Intermediate"
    case advanced = "20:4 -> Advanced"
    
    var fastingPeriod: Double {
        switch self {
        case .beginner:
            return 12
        case .intermediate:
            return 16
        case .advanced:
            return 20
        }
    }
}




class FastingManager: ObservableObject {
    
    
    @Published private(set) var fastingState: FastingState = .notStarted
    @Published private(set) var fastingPlan: FastingPlan = .beginner
    
    
    
    @Published private(set) var fastingSessions: [FastingSession] = []
    
    
    @Published private(set) var startTime: Date {
        didSet {
            print("startTime", startTime.formatted(.dateTime.month().day().hour().minute().second()))
            if fastingState == .Fasting {
                endTime = startTime.addingTimeInterval(fastingTime)
            } else {
                endTime = startTime.addingTimeInterval(feedingTime)
            }
        }
    }
    @Published private(set) var endTime: Date {
        didSet {
            print("endTime", endTime.formatted(.dateTime.month().day().hour().minute().second()))
            
        }
    }
    
    @Published private(set) var elapsed: Bool = false
    @Published private(set) var elapsedTime: Double = 0.0
    @Published private(set) var progress: Double = 0.0

    var fastingTime: Double {
        return fastingPlan.fastingPeriod * 60 * 60
    }
    var feedingTime: Double {
        let totalHours = 24.0
        let fastingHours = fastingPlan.fastingPeriod
        let remainingHours = totalHours - fastingHours
        return remainingHours * 60 * 60
    }

    

    
    init() {
        let calendar = Calendar.current
        
        //        var components = calendar.dateComponents([.year, .month, .day, .hour], from: Date())
        //        components.hour = 20
        //        print(components)
        //
        //        let scheduledTime = calendar.date(from: components) ?? Date.now
        //        print("scheduledTime", scheduledTime.formatted(.dateTime.month().day().hour().minute().second()))
        
        let components = DateComponents(hour: 20)
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        print("scheduledTime", scheduledTime.formatted(.dateTime.month().day().hour().minute().second()))
        
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingPlan.intermediate.fastingPeriod * 60 * 60)
    }
    
    
    
    
    
    func toggleFastingState() {
        if fastingState == .Fasting {
                    // If transitioning from fasting to feeding, record the fasting session
                    recordFastingSession()
                }
        
        fastingState = fastingState == .Fasting ? .feeding : .Fasting
        startTime = Date()
        elapsedTime = 0.0
    }
    
    
    private func recordFastingSession() {


      let elapsed = elapsedTime
      let session = FastingSession(
        startTime: startTime,
        endTime: startTime.addingTimeInterval(elapsed),
        fastingState: .Fasting
      )

      fastingSessions.append(session)
    }
    
    func track() {
        guard fastingState != .notStarted else { return }
        
        print("now", Date().formatted(.dateTime.month().day().hour().minute().second()))
        if endTime >= Date() {
            print("Not elapsed")
            elapsed = false
        } else {
            print("elapsed")
            elapsed = true
        }
        elapsedTime += 1
        print("elapsedTime",elapsedTime)
        
        let totalTime = fastingState == .Fasting ? fastingTime : feedingTime
        progress = (elapsedTime / totalTime * 100).rounded() / 100
        print("progress", progress)
    }
    
    func updateFastingPlan(to newPlan: FastingPlan) {
            self.fastingPlan = newPlan
        }

    struct Course: Identifiable {
        var id = UUID()
        var title: String
        var subtitle: String
        var caption: String
        
    }
    
    struct FastingSession: Identifiable {
        var id = UUID()
        var startTime: Date
        var endTime: Date
        var fastingState: FastingState
    }
    
    
}

