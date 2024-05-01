//
//  MealMacros.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/15/24.
//

import SwiftUI

struct FoodItemMacros<T:FoodItem>: View {
    let foodItem: T
    
    var body: some View {
        VStack {
            HStack {
                MacroColumnView(macro: .protein,
                                grams: foodItem.totalProtein)
                MacroColumnView(macro: .fat,
                                grams: foodItem.totalFat)
                MacroColumnView(macro: .carbs,
                                grams: foodItem.totalCarbs)
            }
            FoodItemMacroBar(foodItem: foodItem)
        }
    }
}

struct MacroColumnView: View {
    @Environment(FoodManager.self) var foodManager
    let macro: Macro
    let grams: Double
    
    var percentOfTarget: Double {
        switch macro {
        case .protein: grams/DebugConstants.targetProtein
        case .fat: grams/DebugConstants.targetFat
        case .carbs: grams/DebugConstants.targetCarbs
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(macro.rawValue)
            Text(foodManager.formatMacro(grams) + " g")
                .font(.caption)
            Text(foodManager.formatPercent(percentOfTarget) + " dv")
                .font(.caption)
        }
        .font(.subheadline)
        .padding(.trailing)
    }
}

struct FoodItemMacroBar<T:FoodItem>: View {
    let foodItem: T
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Macro.carbs.color)
                .frame(height: 10)
            Rectangle()
                .fill(Macro.fat.color)
                .frame(height: 10)
                .scaleEffect(x: foodItem.percentFat + foodItem.percentProtein, anchor: .leading)
            Rectangle()
                .fill(Macro.protein.color)
                .frame(height: 10)
                .scaleEffect(x: foodItem.percentProtein, anchor: .leading)
        }
        .clipShape(Capsule())
    }
}

#Preview {
    FoodItemMacros(foodItem: Meal.standard)
        .environment(FoodManager())
}
