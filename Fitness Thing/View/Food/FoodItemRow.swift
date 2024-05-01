//
//  MealRow.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import SwiftUI

struct FoodItemRow<T:FoodItem>: View {
    @Environment(FoodManager.self) var foodManager
    let foodItem: T
    var showName: Bool = true
    
    var percentDaily: Double {
        foodItem.totalCalories/DebugConstants.targetCal
    }
    
    var portionString: String {
        if let foodItem = foodItem as? MealTemplate {
            return "Per " + foodManager.formatMacro(foodItem.portionSize) + " g"
        }
        else if let foodItem = foodItem as? IngredientTemplate {
            return "Per " + foodManager.formatMacro(foodItem.portionSize) + " g"
        }
        else {
            return foodManager.formatMacro(foodItem.portionSize) + " g"
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if showName == true {
                    Text(foodItem.name)
                        .font(.body)
                }
                Text(portionString)
                Text(foodManager.formatMacro(foodItem.totalCalories) + " cal")
                Text(foodManager.formatPercent(percentDaily) + " dv")
            }
            .font(showName ? .caption : .subheadline)
            Spacer()
            FoodItemMacros(foodItem: foodItem)
                .frame(width: 200)
        }
        .padding()
    }
}

#Preview {
    FoodItemRow(foodItem: MealTemplate.standard, showName: true)
        .environment(FoodManager())
}
