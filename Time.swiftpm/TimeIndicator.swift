//
//  TimeIndicator.swift
//  Time
//
//  Created by Pedro Mota on 13/04/22.
//

import SwiftUI

struct TimeIndicator: View {
    
    @Binding var remainingTime: Int
    
    var body: some View {
        Text("\(remainingTime)")
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity)
            .font(.title)
    }
}

struct TimeIndicator_Previews: PreviewProvider {
    static var previews: some View {
        TimeIndicator(remainingTime: .constant(15))
    }
}
