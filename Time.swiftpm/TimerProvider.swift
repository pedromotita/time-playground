//
//  File.swift
//  Time
//
//  Created by Pedro Mota on 08/04/22.
//

import Foundation
import Combine

class TimerProvider: ObservableObject {
    
    static var shared: TimerProvider {
        let instance = TimerProvider()
        return instance
    }
    
    @Published public var remainingTime = 15
    @Published public var isRunning = false
    
    public var subscription: Cancellable? = nil
    public var publisher = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common)
    
    private init() {}
    
    func start() {
        remainingTime = 15
        publisher = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common)
        subscription = publisher.connect()
    }
    
    func cancel() {
        if let subscription = subscription {
            subscription.cancel()
        }
        self.remainingTime = 15
        
    }
    
    func updateRemainingTime() {
        if remainingTime == 0 {
            self.cancel()
        } else {
            remainingTime = remainingTime - 1
        }
    }
    
}
