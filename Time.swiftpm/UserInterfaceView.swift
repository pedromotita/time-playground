//
//  UserInterfaceView.swift
//  Time
//
//  Created by Pedro Mota on 12/04/22.
//

import SwiftUI

struct UserInterfaceView: View {
    
    @EnvironmentObject private var timer: TimerProvider
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            TimeIndicator(remainingTime: $timer.remainingTime)
                .onReceive(timer.publisher) { _ in
                    withAnimation {
                        timer.updateRemainingTime()
                    }
                }
            Spacer()
            LargeButton(isHidden: $timer.isRunning) {
                withAnimation(.easeOut(duration: 1.0)) {
                    timer.start()
                }
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
