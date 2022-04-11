//
//  File.swift
//  Time
//
//  Created by Pedro Mota on 08/04/22.
//

import Foundation
import Combine

class TimerProvider: ObservableObject {
    
    @Published var remainingTime = 15
    
    private var timerSubscription: Cancellable? = nil
    
    var timerPublisher = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .common)
    
    public func startTimer() {
        remainingTime = 15
        timerPublisher = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .common)
        timerSubscription = self.timerPublisher.connect()
    }
    
    public func cancelTimer() {
        timerSubscription?.cancel()
    }
    
    public func uptadeRemainingTime() {
        if remainingTime <= 1 {
            self.cancelTimer()
        } else {
            remainingTime = remainingTime - 1
        }
    }
}
