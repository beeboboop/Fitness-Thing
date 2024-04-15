//
//  DateView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct DateView: View {
    @Environment(FoodManager.self) var foodManager
    let date = Date()
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
            Text(foodManager.formatDate(date))
                .font(.title)
            Button(action: {}) {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    DateView()
        .environment(FoodManager())
}
