//
//  TimerView.swift
//  Time
//
//  Created by Pedro Mota on 11/04/22.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var timer = TimerProvider.shared
    
    var body: some View {
        ZStack {
            BackgroundView()
            SlidingView(timerProvider: timer)
            UserInterfaceView(timerProvider: timer)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
