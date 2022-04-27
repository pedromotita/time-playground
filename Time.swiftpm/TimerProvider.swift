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
    
    @Published public var remainingTime: Float = 15
    @Published public var isRunning = false
    
    public var subscription: Cancellable? = nil
    public var publisher = Timer.TimerPublisher(interval: 0.2, runLoop: .main, mode: .common)
    
    private init() {}
    
    func start() {
        DispatchQueue.main.async {
            self.remainingTime = 15
            self.publisher = Timer.TimerPublisher(interval: 0.2, runLoop: .main, mode: .common)
            self.subscription = self.publisher.connect()
            self.isRunning = true
        }
    }
    
    func cancel() {
        DispatchQueue.main.async {
            if let subscription = self.subscription {
                subscription.cancel()
            }
        }
    }
    
    func updateRemainingTime() {
        DispatchQueue.main.async {
            print(self.remainingTime)
            if self.remainingTime < 0.1 {
                self.remainingTime = 15
                self.isRunning = false
                self.cancel()
            } else {
                self.remainingTime = self.remainingTime - 0.2
            }
        }
    }
    
}
