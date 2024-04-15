//
//  DailyFoodView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/2/24.
//

import SwiftUI
import SwiftData

struct DailyFoodView: View {
    static func predicate() -> Predicate<FoodDay> {
      let now = Date()
      return #Predicate<FoodDay> { $0.date == now }
    }
    @Query(filter: predicate()) private var foodDay: [FoodDay] = []
    var body: some View {
        VStack {
            DateView()
            if let day = foodDay.first {
                DailyOverviewView(foodDay: day)
                ScrollView(.vertical) {
                    MealsEatenView(mealsEaten: day.mealsEaten)
                }
            }
        }
    }
}

#Preview {
    DailyFoodView()
        .environment(FoodManager())
        .modelContainer(for: [FoodDay.self, MealTemplate.self, IngredientTemplate.self], inMemory: true)
}
