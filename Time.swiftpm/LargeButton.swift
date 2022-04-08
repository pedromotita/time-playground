//
//  File.swift
//  Time
//
//  Created by Pedro Mota on 08/04/22.
//

import Foundation
import SwiftUI

struct LargeButton: View {
    var body: some View {
        Button {
            print("Start timer!")
        } label: {
            Text("Start timer!")
                .foregroundColor(Color.white)
                .frame(maxWidth: .greatestFiniteMagnitude)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 2)
                )
        }
    }
}
