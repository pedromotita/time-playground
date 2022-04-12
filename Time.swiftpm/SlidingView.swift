//
//  SlidingView.swift
//  Time
//
//  Created by Pedro Mota on 12/04/22.
//

import SwiftUI

struct SlidingView: View {
    
    @EnvironmentObject var timer: TimerProvider
    @State var heightDelta: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            Color.init("primary-red")
                .ignoresSafeArea(.all, edges: .all)
                .frame(height: (geometry.size.height)  - heightDelta)
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height, alignment: .bottom)
            .onReceive(timer.publisher) { _ in
                let heightFactor = (geometry.size.height)/CGFloat(15)
                let timeDelta = 15 - timer.remainingTime
                withAnimation(.default) {
                    heightDelta = CGFloat(timeDelta) * heightFactor
                }

                if timer.remainingTime == 0 {
                    withAnimation(.default) {
                        heightDelta = 0
                    }
                }
            }
        }
    }
}

struct SlidingView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingView()
    }
}