//
//  MealRow.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import SwiftUI

struct FoodItemRow: View {
    @Environment(FoodManager.self) var foodManager
    let meal: Meal
    
    var percentDaily: Double {
        meal.totalCalories/DebugConstants.targetCal
    }
    var text1: String {
        foodManager.formatMacro(meal.portionSize) + " g"
    }
    var text2: String {
        foodManager.formatMacro(meal.totalCalories) + " cal" + "\n" + foodManager.formatPercent(percentDaily) + " dv"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(meal.name)
                    .font(.title3)
                Text(text1 + "\n" + text2)
//                Text(foodManager.formatMacro(meal.totalCalories) + " cal")
//                Text(foodManager.formatPercent(percentDaily) + " dv")
            }
            .font(.caption)
            Spacer()
            MealMacros(meal: meal)
        }
        .padding()
    }
}

#Preview {
    FoodItemRow(meal: Meal.standard)
        .environment(FoodManager())
}
