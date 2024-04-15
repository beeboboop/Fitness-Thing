//
//  MealRowView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import SwiftUI

struct MealRowView: View {
    @Environment(FoodManager.self) var foodManager
    let meal: Meal
    
    var percentDaily: Double {
        meal.totalCalories/DebugConstants.targetCal
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(meal.name)
                    .font(.title3)
                Text(foodManager.formatMacro(meal.portionSize) + " g")
                Text(foodManager.formatMacro(meal.totalCalories) + " cal")
                Text(foodManager.formatPercent(percentDaily) + " dv")
            }
            .font(.caption)
            Spacer()
            MealMacrosView(meal: meal)
        }
        .padding()
    }
}

#Preview {
    MealRowView(meal: Meal.standard)
        .environment(FoodManager())
}
