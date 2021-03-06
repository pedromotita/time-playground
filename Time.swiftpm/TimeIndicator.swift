//
//  TimeIndicator.swift
//  Time
//
//  Created by Pedro Mota on 13/04/22.
//

import SwiftUI

struct TimeIndicator: View {
    
    @Binding var remainingTime: Float
    
    var body: some View {
        Text("\(Int(remainingTime))")
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity)
            .font(.system(size: 64))
    }
}

struct TimeIndicator_Previews: PreviewProvider {
    static var previews: some View {
        TimeIndicator(remainingTime: .constant(15))
    }
}
