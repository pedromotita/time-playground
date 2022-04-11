//
//  TimerView.swift
//  Time
//
//  Created by Pedro Mota on 11/04/22.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            ContentView()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
