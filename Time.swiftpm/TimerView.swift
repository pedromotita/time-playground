//
//  TimerView.swift
//  Time
//
//  Created by Pedro Mota on 11/04/22.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject var timer = TimerProvider.shared
    
    var body: some View {
        ZStack {
            BackgroundView()
            SlidingView()
            UserInterfaceView()
        }
        .environmentObject(timer)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
