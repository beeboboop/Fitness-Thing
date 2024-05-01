//
//  WideButton.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/30/24.
//

import SwiftUI

struct WideButton: View {
    let action: () -> Void
    let title: String
    let fillColor: Color
    let accentColor: Color
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(fillColor)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .fill(accentColor)
                Text(title)
                    .font(.body)
                    .foregroundStyle(accentColor)
                    .bold()
            }
        }
        .frame(height: 35)
    }
}

#Preview {
    WideButton(action: {}, title: "Save", fillColor: .blue, accentColor: .white)
}
