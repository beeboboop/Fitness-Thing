//
//  MealMacros.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/15/24.
//

import SwiftUI

struct MealMacros: View {
    let meal: Meal
    
    var body: some View {
        VStack {
            HStack {
                MacroColumnView(macro: .protein,
                                grams: meal.totalProtein)
                MacroColumnView(macro: .fat,
                                grams: meal.totalFat)
                MacroColumnView(macro: .carbs,
                                grams: meal.totalCarbs)
            }
            MealMacroBar(meal: meal)
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
        .padding(.trailing)
    }
}

struct MealMacroBar: View {
    @State private var size: CGSize = .zero
    let meal: Meal
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Macro.protein.color)
                .frame(height: 10)
                .scaleEffect(x: meal.percentProtein, anchor: .leading)
            Rectangle()
                .fill(Macro.fat.color)
                .frame(height: 10)
                .scaleEffect(x: meal.percentFat, anchor: .leading)
                .offset(x: size.width * meal.percentProtein)
            Rectangle()
                .fill(Macro.carbs.color)
                .frame(height: 10)
                .scaleEffect(x: meal.percentCarbs, anchor: .leading)
                .offset(x: size.width * (meal.percentProtein + meal.percentFat))
        }
        .saveSize(in: $size)
    }
}

#Preview {
    MealMacros(meal: Meal.standard)
        .environment(FoodManager())
}
