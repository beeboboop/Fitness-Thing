//
//  MealRow.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import SwiftUI

struct MealRow: View {
    let meal: Meal
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(meal.name)
                Text("\(meal.totalCalories)cal")
            }
        }
    }
}

extension MealRow {
    var percentDaily: Double {
        meal.totalCalories/DebugConstants.targetCal
    }
}

#Preview {
    MealRow(meal: Meal.standard)
}
