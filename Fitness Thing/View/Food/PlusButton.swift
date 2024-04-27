//
//  PlusButton.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/26/24.
//

import SwiftUI

struct PlusButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .bold()
                .foregroundStyle(.appSecondary)
                .padding(5)
                .background() {
                    Circle()
                        .fill(.appPrimary)
                }
        }
    }
}

#Preview {
    PlusButton(action: {})
}
