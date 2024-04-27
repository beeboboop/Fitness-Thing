//
//  DateView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct DateView: View {
    @Environment(FoodManager.self) var foodManager
    @Binding var selectedDate: Date
    
    var body: some View {
        HStack {
            Button(action: { selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate)! }) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
            Text(foodManager.formatDate(selectedDate))
                .font(.title)
            Button(action: { selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate)! }) {
                Image(systemName: "chevron.right")
                    .foregroundStyle(canIncrementDate ? .black : .gray)
            }
            .disabled(!canIncrementDate)
        }
    }
}

extension DateView {
    var canIncrementDate: Bool {
        return foodManager.incrementDate(date: selectedDate) <= Date.now
    }
}

#Preview {
    DateView(selectedDate: .constant(Date()))
        .environment(FoodManager())
}
