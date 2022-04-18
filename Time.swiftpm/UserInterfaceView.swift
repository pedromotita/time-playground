//
//  UserInterfaceView.swift
//  Time
//
//  Created by Pedro Mota on 12/04/22.
//

import SwiftUI

struct UserInterfaceView: View {
    
    @EnvironmentObject private var timer: TimerProvider
    @State private var isTimerRunning: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            TimeIndicator(remainingTime: $timer.remainingTime)
                .onReceive(timer.publisher) { _ in
                    timer.updateRemainingTime()
                    if timer.remainingTime == 0 {
                        withAnimation(.easeIn(duration: 1.0)) {
                            self.isTimerRunning = false
                        }
                    }
                }
            Spacer()
            LargeButton(isHidden: $isTimerRunning) {
                withAnimation(.easeOut(duration: 1.0)) {
                    self.isTimerRunning = true
                }
                timer.start()
            }
        }
    }
}

struct UserInterfaceView_Previews: PreviewProvider {
    static var previews: some View {
        UserInterfaceView()
            .environmentObject(TimerProvider.shared)
    }
}
