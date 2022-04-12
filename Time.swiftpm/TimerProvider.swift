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
    }
    
    func updateRemainingTime() {
        if remainingTime == 0 {
            self.cancel()
        } else {
            remainingTime = remainingTime - 1
        }
    }
    
}
