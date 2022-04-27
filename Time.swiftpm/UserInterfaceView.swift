//
//  UserInterfaceView.swift
//  Time
//
//  Created by Pedro Mota on 12/04/22.
//

import SwiftUI

struct UserInterfaceView: View {
    
    @ObservedObject var timerProvider: TimerProvider
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            TimeIndicator(remainingTime: $timerProvider.remainingTime)
                .onReceive(timerProvider.publisher) { _ in
                    withAnimation {
                        timerProvider.updateRemainingTime()
                    }
                }
            Spacer()
            LargeButton(isHidden: $timerProvider.isRunning) {
                withAnimation(.easeOut(duration: 1.0)) {
                    timerProvider.start()
                }
            }
        }
    }
}

struct UserInterfaceView_Previews: PreviewProvider {
    static var previews: some View {
        UserInterfaceView(timerProvider: TimerProvider.shared)
            .environmentObject(TimerProvider.shared)
    }
}
