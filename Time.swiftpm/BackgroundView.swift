//
//  BackgroundView.swift
//  Time
//
//  Created by Pedro Mota on 11/04/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color.init("dark-blue")
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
