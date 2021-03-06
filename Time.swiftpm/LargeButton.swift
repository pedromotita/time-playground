//
//  File.swift
//  Time
//
//  Created by Pedro Mota on 08/04/22.
//

import Foundation
import SwiftUI

struct LargeButton: View {
    
    @Binding var isHidden: Bool
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("Start timer!")
                .foregroundColor(Color.white)
                .frame(maxWidth: .greatestFiniteMagnitude)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 2)
                )
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
        }
        .opacity(isHidden ? 0 : 1)
    }
}
