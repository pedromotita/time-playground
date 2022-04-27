//
//  SlidingView.swift
//  Time
//
//  Created by Pedro Mota on 12/04/22.
//

import SwiftUI

struct SlidingView: View {
    
    @ObservedObject var timerProvider: TimerProvider
    @State var heightDelta: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            Color.init("primary-red")
                .ignoresSafeArea()
                .frame(height: geometry.size.height - heightDelta)
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height, alignment: .bottom)
            .onReceive(timerProvider.publisher) { _ in
                let heightFactor = (geometry.size.height)/CGFloat(15)
                let timeDelta = 15 - (timerProvider.remainingTime-0.2)
                
                if timerProvider.remainingTime > 0.0001 {
                    withAnimation(.default) {
                        heightDelta = CGFloat(timeDelta) * heightFactor
                    }
                } else {
                    withAnimation(.default) {
                        timerProvider.cancel()
                        heightDelta = 0
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct SlidingView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingView(timerProvider: TimerProvider.shared)
            .environmentObject(TimerProvider.shared)
    }
}
